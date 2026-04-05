import 'dart:async';
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:playground/feature/ble/application/state/counter_remote_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_connection_state.dart';
import 'package:playground/feature/ble/domain/entity/counter_command.dart';
import 'package:playground/feature/ble/infra/repository/ble_repository_impl.dart';

import '../../../../helpers/mocks.dart';

/// イベントキューを十分に処理する
Future<void> pumpEventQueue() async {
  for (var i = 0; i < 5; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  const deviceId = 'test-device-id';

  late MockBleRepository mockRepository;
  late ProviderContainer container;
  late StreamController<({String deviceId, BleConnectionState state})>
  connectionController;
  late StreamController<List<int>> notifyController;

  setUp(() {
    mockRepository = MockBleRepository();
    connectionController =
        StreamController<
          ({String deviceId, BleConnectionState state})
        >.broadcast();
    notifyController = StreamController<List<int>>.broadcast();

    when(
      () => mockRepository.connectionStateStream,
    ).thenAnswer((_) => connectionController.stream);
    when(
      () => mockRepository.connect(any()),
    ).thenAnswer((_) async {});
    when(
      () => mockRepository.disconnect(any()),
    ).thenAnswer((_) async {});
    when(
      () => mockRepository.discoverServices(any()),
    ).thenAnswer((_) async => []);
    when(
      () => mockRepository.subscribeCharacteristic(
        deviceId: any(named: 'deviceId'),
        serviceUuid: any(named: 'serviceUuid'),
        characteristicUuid: any(named: 'characteristicUuid'),
      ),
    ).thenAnswer((_) => notifyController.stream);
    when(
      () => mockRepository.writeCharacteristic(
        deviceId: any(named: 'deviceId'),
        serviceUuid: any(named: 'serviceUuid'),
        characteristicUuid: any(named: 'characteristicUuid'),
        value: any(named: 'value'),
      ),
    ).thenAnswer((_) async {});

    container = ProviderContainer(
      overrides: [
        bleRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() async {
    container.dispose();
    await connectionController.close();
    await notifyController.close();
  });

  group('CounterRemoteNotifier', () {
    group('build', () {
      test('initializes with disconnected state', () {
        final state = container.read(counterRemoteProvider(deviceId));

        expect(
          state.connectionState,
          BleConnectionState.disconnected,
        );
        expect(state.currentValue, isNull);
        expect(state.isLoading, isFalse);
        expect(state.error, isNull);
      });
    });

    group('connect', () {
      test('transitions to connected state', () async {
        final notifier = container.read(
          counterRemoteProvider(deviceId).notifier,
        );

        await notifier.connect();

        final state = container.read(counterRemoteProvider(deviceId));
        expect(
          state.connectionState,
          BleConnectionState.connected,
        );
        expect(state.isLoading, isFalse);
      });

      test('receives counter value from notify', () async {
        CounterRemoteState? latest;
        container.listen(
          counterRemoteProvider(deviceId),
          (_, state) {
            latest = state;
          },
        );

        final notifier = container.read(
          counterRemoteProvider(deviceId).notifier,
        );
        await notifier.connect();

        notifyController.add(utf8.encode('42'));
        await pumpEventQueue();

        expect(latest?.currentValue, 42);
      });

      test('sets error on connection failure', () async {
        when(
          () => mockRepository.connect(any()),
        ).thenThrow(Exception('connection failed'));
        final notifier = container.read(
          counterRemoteProvider(deviceId).notifier,
        );

        await notifier.connect();

        final state = container.read(counterRemoteProvider(deviceId));
        expect(state.error, isNotNull);
        expect(state.isLoading, isFalse);
      });
    });

    group('disconnect', () {
      test('transitions to disconnected state', () async {
        final notifier = container.read(
          counterRemoteProvider(deviceId).notifier,
        );
        await notifier.connect();

        await notifier.disconnect();

        final state = container.read(counterRemoteProvider(deviceId));
        expect(
          state.connectionState,
          BleConnectionState.disconnected,
        );
        expect(state.currentValue, isNull);
      });
    });

    group('sendCommand', () {
      test('writes command to characteristic', () async {
        final notifier = container.read(
          counterRemoteProvider(deviceId).notifier,
        );
        await notifier.connect();

        await notifier.sendCommand(CounterCommand.increment);

        verify(
          () => mockRepository.writeCharacteristic(
            deviceId: deviceId,
            serviceUuid: any(named: 'serviceUuid'),
            characteristicUuid: any(named: 'characteristicUuid'),
            value: CounterCommand.increment.encode(),
          ),
        ).called(1);
      });
    });

    group('connection state monitoring', () {
      test('transitions to disconnected on unexpected '
          'disconnect event', () async {
        CounterRemoteState? latest;
        container.listen(
          counterRemoteProvider(deviceId),
          (_, state) {
            latest = state;
          },
        );

        final notifier = container.read(
          counterRemoteProvider(deviceId).notifier,
        );
        await notifier.connect();

        // Peripheral 側から接続が切断された場合
        connectionController.add((
          deviceId: deviceId,
          state: BleConnectionState.disconnected,
        ));
        await pumpEventQueue();

        expect(
          latest?.connectionState,
          BleConnectionState.disconnected,
        );
        expect(latest?.currentValue, isNull);
      });

      test('ignores disconnect events for other devices', () async {
        CounterRemoteState? latest;
        container.listen(
          counterRemoteProvider(deviceId),
          (_, state) {
            latest = state;
          },
        );

        final notifier = container.read(
          counterRemoteProvider(deviceId).notifier,
        );
        await notifier.connect();

        // connect 後の最新状態を記録
        final stateAfterConnect = latest;

        connectionController.add((
          deviceId: 'other-device',
          state: BleConnectionState.disconnected,
        ));
        await pumpEventQueue();

        // connect 後の状態から変化していないこと
        expect(
          latest?.connectionState,
          stateAfterConnect?.connectionState,
        );
      });
    });
  });
}
