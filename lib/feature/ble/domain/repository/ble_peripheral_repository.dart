import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_characteristic_property.dart';

/// BLE Peripheral 操作のリポジトリインターフェース
abstract class BlePeripheralRepository {
  BleAdapterState get adapterState;
  Stream<BleAdapterState> get adapterStateStream;
  Future<bool> authorize();

  /// GATT サービスを登録してアドバタイズを開始する
  Future<void> startAdvertising({
    required String serviceUuid,
    required String characteristicUuid,
    String? deviceName,
    List<BleCharacteristicProperty> properties,
  });

  Future<void> stopAdvertising();

  /// Central からの Read リクエストに自動応答するリスナーを開始
  Future<void> startHandlingRequests({required String responseValue});

  /// Central からの Write リクエストを受信するストリーム
  Stream<List<int>> get writeRequestStream;

  /// 接続中の全 Central に Notify を送信
  Future<void> notifyValue({required List<int> value});

  /// 接続中の Central 数を監視するストリーム
  Stream<int> get connectedCentralCountStream;
}
