import 'package:playground/feature/wifi/domain/entity/wifi_device.dart';

/// Wi-Fi クライアント側のリポジトリインターフェース
abstract class WifiClientRepository {
  /// mDNS でサービスを発見するストリーム
  Stream<List<WifiDevice>> get discoveredDevices;

  /// mDNS サービス発見を開始する
  Future<void> startDiscovery();

  /// mDNS サービス発見を停止する
  Future<void> stopDiscovery();

  /// WebSocket でサーバーに接続する
  Future<void> connect({required String host, required int port});

  /// 接続を切断する
  void disconnect();

  /// サーバーからのメッセージを受信するストリーム
  Stream<String> get messageStream;

  /// サーバーにメッセージを送信する
  void sendMessage(String message);
}
