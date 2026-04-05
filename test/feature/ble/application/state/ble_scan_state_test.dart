import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:playground/feature/ble/application/state/ble_scan_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_device.dart';
import 'package:playground/feature/ble/infra/repository/ble_repository_impl.dart';

import '../../../../helpers/mocks.dart';

/// イベントキューを十分に処理する
Future<void> pumpEventQueue() async {
  for (var i = 0; i < 5; i++) {
    await Future<void>.delayed(Duration.zero);
  }
}

void main() {
  late MockBleRepository mockRepository;
  late ProviderContainer container;
  late StreamController<BleAdapterState> adapterStateController;
  late StreamController<BleDevice> discoveryController;

  setUp(() {
    mockRepository = MockBleRepository();
    adapterStateController = StreamController<BleAdapterState>.broadcast();
    discoveryController = StreamController<BleDevice>.broadcast();

    when(
      () => mockRepository.adapterState,
    ).thenReturn(BleAdapterState.poweredOn);
    when(
      () => mockRepository.adapterStateStream,
    ).thenAnswer((_) => adapterStateController.stream);
    when(
      () => mockRepository.discoveredDevices,
    ).thenAnswer((_) => discoveryController.stream);
    when(
      () => mockRepository.connectionStateStream,
    ).thenAnswer((_) => const Stream.empty());
    when(
      () => mockRepository.authorize(),
    ).thenAnswer((_) async => true);
    when(
      () => mockRepository.startScan(),
    ).thenAnswer((_) async {});
    when(
      () => mockRepository.stopScan(),
    ).thenAnswer((_) async {});

    container = ProviderContainer(
      overrides: [
        bleRepositoryProvider.overrideWithValue(mockRepository),
      ],
    );
  });

  tearDown(() async {
    container.dispose();
    await adapterStateController.close();
    await discoveryController.close();
  });

  group('BleScanNotifier', () {
    group('build', () {
      test('initializes with current adapter state', () {
        final state = container.read(bleScanProvider);

        expect(state.adapterState, BleAdapterState.poweredOn);
        expect(state.devices, isEmpty);
        expect(state.isScanning, isFalse);
      });

      test('updates adapter state from stream', () async {
        // listen で状態変化をキャプチャする
        BleScanState? latest;
        container.listen(bleScanProvider, (_, state) {
          latest = state;
        });

        adapterStateController.add(BleAdapterState.poweredOff);
        await pumpEventQueue();

        expect(latest?.adapterState, BleAdapterState.poweredOff);
      });
    });

    group('startScan', () {
      test('sets isScanning to true and clears devices', () async {
        final notifier = container.read(bleScanProvider.notifier);

        await notifier.startScan();

        final state = container.read(bleScanProvider);
        expect(state.isScanning, isTrue);
        expect(state.devices, isEmpty);
      });

      test('does not start scan when authorization denied', () async {
        when(
          () => mockRepository.authorize(),
        ).thenAnswer((_) async => false);
        final notifier = container.read(bleScanProvider.notifier);

        await notifier.startScan();

        verifyNever(() => mockRepository.startScan());
      });

      test('adds discovered devices to state', () async {
        BleScanState? latest;
        container.listen(bleScanProvider, (_, state) {
          latest = state;
        });

        final notifier = container.read(bleScanProvider.notifier);
        await notifier.startScan();

        discoveryController.add(
          const BleDevice(
            id: 'device-1',
            rssi: -50,
            name: 'Test',
          ),
        );
        await pumpEventQueue();

        expect(latest?.devices, hasLength(1));
        expect(latest?.devices.first.id, 'device-1');
      });

      test('deduplicates devices by id and preserves name', () async {
        BleScanState? latest;
        container.listen(bleScanProvider, (_, state) {
          latest = state;
        });

        final notifier = container.read(bleScanProvider.notifier);
        await notifier.startScan();

        // 最初のパケット: 名前あり
        discoveryController.add(
          const BleDevice(
            id: 'device-1',
            rssi: -50,
            name: 'Test',
          ),
        );
        await pumpEventQueue();

        // 2回目のパケット: 名前なし
        // BLE ではパケットにより名前の有無が変わる
        discoveryController.add(
          const BleDevice(id: 'device-1', rssi: -45),
        );
        await pumpEventQueue();

        expect(latest?.devices, hasLength(1));
        // 名前は最初のパケットの値が保持される
        expect(latest?.devices.first.name, 'Test');
        // RSSI は最新値に更新される
        expect(latest?.devices.first.rssi, -45);
      });
    });

    group('stopScan', () {
      test('sets isScanning to false', () async {
        final notifier = container.read(bleScanProvider.notifier);
        await notifier.startScan();

        await notifier.stopScan();

        final state = container.read(bleScanProvider);
        expect(state.isScanning, isFalse);
      });
    });
  });
}
