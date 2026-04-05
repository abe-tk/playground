import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_characteristic_property.dart';
import 'package:playground/feature/ble/domain/entity/ble_constants.dart';
import 'package:playground/feature/ble/domain/entity/counter_command.dart';
import 'package:playground/feature/ble/infra/repository/ble_peripheral_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_display_state.freezed.dart';
part 'counter_display_state.g.dart';

@freezed
abstract class CounterDisplayState with _$CounterDisplayState {
  const factory CounterDisplayState({
    @Default(BleAdapterState.unknown) BleAdapterState adapterState,
    @Default(false) bool isAdvertising,
    @Default(false) bool isLoading,
    @Default(0) int counter,
    @Default(0) int connectedCentralCount,
    String? error,
  }) = _CounterDisplayState;
}

@riverpod
class CounterDisplayNotifier extends _$CounterDisplayNotifier {
  StreamSubscription<BleAdapterState>? _adapterStateSub;
  StreamSubscription<int>? _centralCountSub;
  StreamSubscription<List<int>>? _writeRequestSub;

  @override
  CounterDisplayState build() {
    final repository = ref.watch(blePeripheralRepositoryProvider);

    unawaited(_adapterStateSub?.cancel());
    _adapterStateSub = repository.adapterStateStream.listen(
      (adapterState) {
        state = state.copyWith(adapterState: adapterState);
      },
      onError: (Object e) {
        state = state.copyWith(error: e.toString());
      },
    );

    unawaited(_centralCountSub?.cancel());
    _centralCountSub = repository.connectedCentralCountStream.listen(
      (count) {
        state = state.copyWith(connectedCentralCount: count);
      },
      onError: (Object e) {
        state = state.copyWith(error: e.toString());
      },
    );

    ref.onDispose(() {
      unawaited(_adapterStateSub?.cancel());
      unawaited(_centralCountSub?.cancel());
      unawaited(_writeRequestSub?.cancel());
    });

    return CounterDisplayState(
      adapterState: repository.adapterState,
    );
  }

  Future<void> startAdvertising() async {
    final repository = ref.read(blePeripheralRepositoryProvider);
    state = state.copyWith(error: null, isLoading: true);

    try {
      final authorized = await repository.authorize();
      if (!authorized) {
        state = state.copyWith(
          error: '権限が許可されていません',
          isLoading: false,
        );
        return;
      }

      // authorize 後、Bluetooth アダプタが poweredOn になるまでの
      // 猶予を設ける。ble_peripheral_state では adapterStateStream を
      // 待機しているが、PeripheralManager では authorize 直後に
      // poweredOn が即座に返らないケースがあるため固定 wait で対応。
      await Future<void>.delayed(const Duration(seconds: 1));

      final deviceName = '$counterAdvertiseName ${Platform.localHostname}';
      await repository.startAdvertising(
        serviceUuid: counterServiceUuid,
        characteristicUuid: counterCharacteristicUuid,
        deviceName: deviceName,
        properties: [
          BleCharacteristicProperty.read,
          BleCharacteristicProperty.write,
          BleCharacteristicProperty.notify,
        ],
      );
      await repository.startHandlingRequests(
        responseValue: state.counter.toString(),
      );

      // Write リクエスト（コマンド）を監視
      unawaited(_writeRequestSub?.cancel());
      _writeRequestSub = repository.writeRequestStream.listen(_handleCommand);

      state = state.copyWith(isAdvertising: true, isLoading: false);
      // ignore: avoid_catches_without_on_clauses, プラットフォーム側が Error をスローする場合がある
    } catch (e) {
      state = state.copyWith(
        error: e.toString(),
        isLoading: false,
      );
    }
  }

  Future<void> stopAdvertising() async {
    final repository = ref.read(blePeripheralRepositoryProvider);
    try {
      await repository.stopAdvertising();
      unawaited(_writeRequestSub?.cancel());
      _writeRequestSub = null;
      state = state.copyWith(
        isAdvertising: false,
        connectedCentralCount: 0,
        counter: 0,
      );
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void _handleCommand(List<int> bytes) {
    final command = CounterCommand.decode(bytes);
    if (command == null) return;

    final newCounter = switch (command) {
      CounterCommand.increment => state.counter + 1,
      CounterCommand.decrement => state.counter - 1,
      CounterCommand.reset => 0,
    };

    state = state.copyWith(counter: newCounter);

    // 更新後の値を全 Central に Notify
    final repository = ref.read(blePeripheralRepositoryProvider);
    unawaited(
      repository.notifyValue(
        value: utf8.encode(newCounter.toString()),
      ),
    );
  }
}
