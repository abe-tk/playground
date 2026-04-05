import 'dart:async';
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_constants.dart';
import 'package:playground/feature/ble/infra/repository/ble_peripheral_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ble_peripheral_state.freezed.dart';
part 'ble_peripheral_state.g.dart';

@freezed
abstract class BlePeripheralState with _$BlePeripheralState {
  const factory BlePeripheralState({
    @Default(BleAdapterState.unknown) BleAdapterState adapterState,
    @Default(false) bool isAdvertising,
    @Default(false) bool isLoading,
    @Default(0) int connectedCentralCount,
    String? error,
  }) = _BlePeripheralState;
}

@riverpod
class BlePeripheralNotifier extends _$BlePeripheralNotifier {
  StreamSubscription<BleAdapterState>? _adapterStateSub;
  StreamSubscription<int>? _centralCountSub;

  @override
  BlePeripheralState build() {
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
    });

    return BlePeripheralState(
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

      // authorize 後、poweredOn になるのを待つ
      var currentState = repository.adapterState;
      if (currentState != BleAdapterState.poweredOn) {
        currentState = await repository.adapterStateStream
            .firstWhere((s) => s == BleAdapterState.poweredOn)
            .timeout(const Duration(seconds: 5));
      }
      state = state.copyWith(adapterState: currentState);

      final deviceName = '$bleAdvertiseName ${Platform.localHostname}';
      await repository.startAdvertising(
        serviceUuid: bleServiceUuid,
        characteristicUuid: bleCharacteristicUuid,
        deviceName: deviceName,
      );
      await repository.startHandlingRequests(
        responseValue: Platform.localHostname,
      );
      state = state.copyWith(
        isAdvertising: true,
        isLoading: false,
        error: null,
      );
      // ignore: avoid_catches_without_on_clauses, プラットフォーム側が Error をスローする場合がある
    } catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> stopAdvertising() async {
    final repository = ref.read(blePeripheralRepositoryProvider);
    try {
      await repository.stopAdvertising();
      state = state.copyWith(
        isAdvertising: false,
        connectedCentralCount: 0,
      );
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}
