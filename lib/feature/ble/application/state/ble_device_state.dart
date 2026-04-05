import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playground/feature/ble/domain/entity/ble_connection_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_gatt_service.dart';
import 'package:playground/feature/ble/infra/repository/ble_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ble_device_state.freezed.dart';
part 'ble_device_state.g.dart';

@freezed
abstract class BleDeviceState with _$BleDeviceState {
  const factory BleDeviceState({
    @Default(BleConnectionState.disconnected)
    BleConnectionState connectionState,
    @Default([]) List<BleGattService> services,
    @Default(false) bool isLoading,
    String? readValue,
    String? error,
  }) = _BleDeviceState;
}

@riverpod
class BleDeviceNotifier extends _$BleDeviceNotifier {
  StreamSubscription<({String deviceId, BleConnectionState state})>?
  _connectionSub;

  @override
  BleDeviceState build(String deviceId) {
    final repository = ref.watch(bleRepositoryProvider);

    unawaited(_connectionSub?.cancel());
    _connectionSub = repository.connectionStateStream.listen(
      (event) {
        if (event.deviceId != deviceId) return;
        state = state.copyWith(
          connectionState: event.state,
          // 切断時はサービスリストをクリア
          services: event.state == BleConnectionState.disconnected
              ? []
              : state.services,
        );
      },
      onError: (Object e) {
        state = state.copyWith(error: e.toString());
      },
    );

    ref.onDispose(() {
      unawaited(_connectionSub?.cancel());
    });

    return const BleDeviceState();
  }

  Future<void> connect() async {
    final repository = ref.read(bleRepositoryProvider);
    state = state.copyWith(isLoading: true, error: null);
    try {
      await repository.connect(deviceId);
      state = state.copyWith(
        connectionState: BleConnectionState.connected,
        isLoading: false,
      );
      await _discoverServices();
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> disconnect() async {
    final repository = ref.read(bleRepositoryProvider);
    state = state.copyWith(isLoading: true);
    try {
      await repository.disconnect(deviceId);
      state = state.copyWith(
        connectionState: BleConnectionState.disconnected,
        services: [],
        isLoading: false,
        readValue: null,
      );
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> readCharacteristic({
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final repository = ref.read(bleRepositoryProvider);
    state = state.copyWith(isLoading: true, error: null, readValue: null);
    try {
      final bytes = await repository.readCharacteristic(
        deviceId: deviceId,
        serviceUuid: serviceUuid,
        characteristicUuid: characteristicUuid,
      );
      // HEX表示 + UTF-8テキストとしての解釈を試みる
      final hex = bytes
          .map((b) => b.toRadixString(16).padLeft(2, '0'))
          .join(' ');
      var display = 'HEX: $hex';
      try {
        final text = utf8.decode(bytes);
        display += '\nUTF-8: $text';
      } on FormatException {
        // UTF-8として解釈できない場合は HEX のみ
      }
      state = state.copyWith(isLoading: false, readValue: display);
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> _discoverServices() async {
    final repository = ref.read(bleRepositoryProvider);
    state = state.copyWith(isLoading: true);
    try {
      final services = await repository.discoverServices(deviceId);
      for (final service in services) {
        log(
          'Service: ${service.uuid} '
          '(${service.isPrimary ? "Primary" : "Secondary"}) '
          '- ${service.characteristics.length} characteristics',
        );
        for (final char in service.characteristics) {
          log(
            '  Characteristic: ${char.uuid} '
            '[${char.properties.map((p) => p.name).join(", ")}]',
          );
        }
      }
      state = state.copyWith(services: services, isLoading: false);
    } on Exception catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
