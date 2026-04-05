import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_connection_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_device.dart';
import 'package:playground/feature/ble/domain/entity/ble_gatt_service.dart';

/// BLE操作のリポジトリインターフェース
abstract class BleRepository {
  // アダプタ状態
  BleAdapterState get adapterState;
  Stream<BleAdapterState> get adapterStateStream;
  Future<bool> authorize();

  // スキャン
  Stream<BleDevice> get discoveredDevices;
  Future<void> startScan();
  Future<void> stopScan();

  // 接続
  Future<void> connect(String deviceId);
  Future<void> disconnect(String deviceId);
  Stream<({String deviceId, BleConnectionState state})>
  get connectionStateStream;

  // GATT
  Future<List<BleGattService>> discoverServices(String deviceId);
  Future<List<int>> readCharacteristic({
    required String deviceId,
    required String serviceUuid,
    required String characteristicUuid,
  });
  Future<void> writeCharacteristic({
    required String deviceId,
    required String serviceUuid,
    required String characteristicUuid,
    required List<int> value,
  });
  Stream<List<int>> subscribeCharacteristic({
    required String deviceId,
    required String serviceUuid,
    required String characteristicUuid,
  });
}
