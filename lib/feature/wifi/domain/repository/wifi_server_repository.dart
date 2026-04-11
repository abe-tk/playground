/// Wi-Fi サーバー側のリポジトリインターフェース
abstract class WifiServerRepository {
  /// WebSocket サーバーを起動し、mDNS にサービスを登録する
  Future<void> start({required String serviceName, required int port});

  /// サーバーを停止し、mDNS 登録を解除する
  Future<void> stop();

  /// クライアントからのメッセージを受信するストリーム
  Stream<String> get messageStream;

  /// 接続中の全クライアントにメッセージを送信する
  void sendMessage(String message);

  /// 接続中のクライアント数を監視するストリーム
  Stream<int> get connectedClientCountStream;
}
