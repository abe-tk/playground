import 'dart:async';
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'package:playground/feature/ble/domain/entity/ble_connection_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_constants.dart';
import 'package:playground/feature/ble/domain/entity/counter_command.dart';
import 'package:playground/feature/ble/infra/repository/ble_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_remote_state.freezed.dart';
part 'counter_remote_state.g.dart';

@freezed
abstract class CounterRemoteState with _$CounterRemoteState {
  const factory CounterRemoteState({
    @Default(BleConnectionState.disconnected)
    BleConnectionState connectionState,
    @Default(false) bool isLoading,
    int? currentValue,
    String? error,
  }) = _CounterRemoteState;
}

@riverpod
class CounterRemoteNotifier extends _$CounterRemoteNotifier {
  StreamSubscription<List<int>>? _notifySub;
  StreamSubscription<({String deviceId, BleConnectionState state})>?
  _connectionSub;

  @override
  CounterRemoteState build(String deviceId) {
    final repository = ref.watch(bleRepositoryProvider);

    // 接続状態を監視し、予期しない切断を検知する
    unawaited(_connectionSub?.cancel());
    _connectionSub = repository.connectionStateStream.listen(
      (event) {
        if (event.deviceId != deviceId) return;
        if (event.state == BleConnectionState.disconnected) {
          unawaited(_notifySub?.cancel());
          _notifySub = null;
          state = state.copyWith(
            connectionState: BleConnectionState.disconnected,
            currentValue: null,
          );
        }
      },
      onError: (Object e) {
        state = state.copyWith(error: e.toString());
      },
    );

    ref.onDispose(() {
      unawaited(_notifySub?.cancel());
      unawaited(_connectionSub?.cancel());
    });
    return const CounterRemoteState();
  }

  Future<void> connect() async {
    final repository = ref.read(bleRepositoryProvider);
    state = state.copyWith(isLoading: true, error: null);

    try {
      await repository.connect(deviceId);
      state = state.copyWith(
        connectionState: BleConnectionState.connected,
      );

      await repository.discoverServices(deviceId);

      // Notify を購読してカウンター値を受信
      _notifySub = repository
          .subscribeCharacteristic(
            deviceId: deviceId,
            serviceUuid: counterServiceUuid,
            characteristicUuid: counterCharacteristicUuid,
          )
          .listen(
            (bytes) {
              final value = int.tryParse(utf8.decode(bytes));
              if (value != null) {
                state = state.copyWith(currentValue: value);
              }
            },
            onError: (Object e) {
              state = state.copyWith(error: e.toString());
            },
          );

      state = state.copyWith(isLoading: false);
      // ignore: avoid_catches_without_on_clauses, プラットフォーム側が Error をスローする場合がある
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }

  Future<void> disconnect() async {
    final repository = ref.read(bleRepositoryProvider);
    try {
      await repository.disconnect(deviceId);
      unawaited(_notifySub?.cancel());
      _notifySub = null;
      state = state.copyWith(
        connectionState: BleConnectionState.disconnected,
        currentValue: null,
      );
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> sendCommand(CounterCommand command) async {
    final repository = ref.read(bleRepositoryProvider);
    state = state.copyWith(error: null);
    try {
      await repository.writeCharacteristic(
        deviceId: deviceId,
        serviceUuid: counterServiceUuid,
        characteristicUuid: counterCharacteristicUuid,
        value: command.encode(),
      );
      // ignore: avoid_catches_without_on_clauses, プラットフォーム側が Error をスローする場合がある
    } catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }
}
