import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bluetooth_low_energy/bluetooth_low_energy.dart'
    hide ConnectionState;
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart'
    as ble
    show ConnectionState;
import 'package:permission_handler/permission_handler.dart';
import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_characteristic_property.dart';
import 'package:playground/feature/ble/domain/entity/ble_connection_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_device.dart';
import 'package:playground/feature/ble/domain/entity/ble_gatt_characteristic.dart';
import 'package:playground/feature/ble/domain/entity/ble_gatt_service.dart';
import 'package:playground/feature/ble/domain/repository/ble_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ble_repository_impl.g.dart';

@riverpod
BleRepository bleRepository(Ref ref) {
  return BleRepositoryImpl();
}

class BleRepositoryImpl implements BleRepository {
  BleRepositoryImpl() : _centralManager = CentralManager();

  final CentralManager _centralManager;

  /// スキャンで発見した Peripheral のキャッシュ
  final Map<String, Peripheral> _peripherals = {};

  /// GATT探索で取得したサービスのキャッシュ
  final Map<String, List<GATTService>> _gattCache = {};

  // --- アダプタ状態 ---

  @override
  BleAdapterState get adapterState => _mapAdapterState(_centralManager.state);

  @override
  Stream<BleAdapterState> get adapterStateStream =>
      _centralManager.stateChanged.map((e) => _mapAdapterState(e.state));

  @override
  Future<bool> authorize() async {
    // iOS/macOS では authorize 非対応（システムが自動で権限管理する）
    if (Platform.isIOS || Platform.isMacOS) return true;

    // Android: Bluetooth 権限
    final bleAuthorized = await _centralManager.authorize();
    if (!bleAuthorized) return false;

    // Android: 位置情報権限（BLE スキャンに必要）
    final locationStatus = await Permission.locationWhenInUse.request();
    return locationStatus.isGranted;
  }

  // --- スキャン ---

  @override
  Stream<BleDevice> get discoveredDevices => _centralManager.discovered.map(
    (e) {
      final id = e.peripheral.uuid.toString();
      _peripherals[id] = e.peripheral;
      return BleDevice(
        id: id,
        rssi: e.rssi,
        name: e.advertisement.name,
        serviceUuids: e.advertisement.serviceUUIDs
            .map((u) => u.toString())
            .toList(),
      );
    },
  );

  @override
  Future<void> startScan() => _centralManager.startDiscovery();

  @override
  Future<void> stopScan() => _centralManager.stopDiscovery();

  // --- 接続 ---

  @override
  Future<void> connect(String deviceId) async {
    final peripheral = _peripherals[deviceId];
    if (peripheral == null) {
      throw StateError('デバイス $deviceId が見つかりません');
    }
    await _centralManager.connect(peripheral);
  }

  @override
  Future<void> disconnect(String deviceId) async {
    final peripheral = _peripherals[deviceId];
    if (peripheral == null) return;
    _gattCache.remove(deviceId);
    await _centralManager.disconnect(peripheral);
  }

  @override
  Stream<({String deviceId, BleConnectionState state})>
  get connectionStateStream => _centralManager.connectionStateChanged.map((e) {
    final isConnected = e.state == ble.ConnectionState.connected;
    if (!isConnected) {
      _gattCache.remove(e.peripheral.uuid.toString());
    }
    return (
      deviceId: e.peripheral.uuid.toString(),
      state: isConnected
          ? BleConnectionState.connected
          : BleConnectionState.disconnected,
    );
  });

  // --- GATT ---

  @override
  Future<List<BleGattService>> discoverServices(String deviceId) async {
    final peripheral = _peripherals[deviceId];
    if (peripheral == null) {
      throw StateError('デバイス $deviceId が見つかりません');
    }
    final services = await _centralManager.discoverGATT(peripheral);
    _gattCache[deviceId] = services;
    return services.map(_mapService).toList();
  }

  @override
  Future<List<int>> readCharacteristic({
    required String deviceId,
    required String serviceUuid,
    required String characteristicUuid,
  }) async {
    final (peripheral, characteristic) = _resolveCharacteristic(
      deviceId: deviceId,
      serviceUuid: serviceUuid,
      characteristicUuid: characteristicUuid,
    );
    final value = await _centralManager.readCharacteristic(
      peripheral,
      characteristic,
    );
    return value.toList();
  }

  @override
  Future<void> writeCharacteristic({
    required String deviceId,
    required String serviceUuid,
    required String characteristicUuid,
    required List<int> value,
  }) async {
    final (peripheral, characteristic) = _resolveCharacteristic(
      deviceId: deviceId,
      serviceUuid: serviceUuid,
      characteristicUuid: characteristicUuid,
    );
    await _centralManager.writeCharacteristic(
      peripheral,
      characteristic,
      value: Uint8List.fromList(value),
      type: GATTCharacteristicWriteType.withResponse,
    );
  }

  @override
  Stream<List<int>> subscribeCharacteristic({
    required String deviceId,
    required String serviceUuid,
    required String characteristicUuid,
  }) {
    final (peripheral, characteristic) = _resolveCharacteristic(
      deviceId: deviceId,
      serviceUuid: serviceUuid,
      characteristicUuid: characteristicUuid,
    );

    unawaited(
      _centralManager.setCharacteristicNotifyState(
        peripheral,
        characteristic,
        state: true,
      ),
    );

    return _centralManager.characteristicNotified
        .where(
          (e) => e.characteristic.uuid.toString() == characteristicUuid,
        )
        .map((e) => e.value.toList());
  }

  // --- 内部ヘルパー ---

  /// deviceId / serviceUuid / characteristicUuid から Peripheral と
  /// GATTCharacteristic を解決する。見つからない場合は StateError をスローする。
  (Peripheral, GATTCharacteristic) _resolveCharacteristic({
    required String deviceId,
    required String serviceUuid,
    required String characteristicUuid,
  }) {
    final peripheral = _peripherals[deviceId];
    if (peripheral == null) {
      throw StateError('デバイス $deviceId が見つかりません');
    }
    final services = _gattCache[deviceId];
    if (services == null) {
      throw StateError(
        'デバイス $deviceId の GATT サービスが未探索です。'
        ' 先に discoverServices を呼び出してください',
      );
    }
    final service = services.firstWhere(
      (s) => s.uuid.toString() == serviceUuid,
    );
    final characteristic = service.characteristics.firstWhere(
      (c) => c.uuid.toString() == characteristicUuid,
    );
    return (peripheral, characteristic);
  }

  // --- マッピング ---

  BleAdapterState _mapAdapterState(BluetoothLowEnergyState state) {
    return switch (state) {
      BluetoothLowEnergyState.unknown => BleAdapterState.unknown,
      BluetoothLowEnergyState.unsupported => BleAdapterState.unsupported,
      BluetoothLowEnergyState.unauthorized => BleAdapterState.unauthorized,
      BluetoothLowEnergyState.poweredOff => BleAdapterState.poweredOff,
      BluetoothLowEnergyState.poweredOn => BleAdapterState.poweredOn,
    };
  }

  BleGattService _mapService(GATTService service) {
    return BleGattService(
      uuid: service.uuid.toString(),
      isPrimary: service.isPrimary,
      characteristics: service.characteristics.map(_mapCharacteristic).toList(),
    );
  }

  BleGattCharacteristic _mapCharacteristic(GATTCharacteristic characteristic) {
    return BleGattCharacteristic(
      uuid: characteristic.uuid.toString(),
      properties: characteristic.properties.map(_mapProperty).toList(),
    );
  }

  BleCharacteristicProperty _mapProperty(GATTCharacteristicProperty property) {
    return switch (property) {
      GATTCharacteristicProperty.read => BleCharacteristicProperty.read,
      GATTCharacteristicProperty.write => BleCharacteristicProperty.write,
      GATTCharacteristicProperty.writeWithoutResponse =>
        BleCharacteristicProperty.writeWithoutResponse,
      GATTCharacteristicProperty.notify => BleCharacteristicProperty.notify,
      GATTCharacteristicProperty.indicate => BleCharacteristicProperty.indicate,
    };
  }
}
