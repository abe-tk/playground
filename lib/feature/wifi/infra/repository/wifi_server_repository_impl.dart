import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:nsd/nsd.dart';
import 'package:playground/feature/wifi/domain/repository/wifi_server_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'wifi_server_repository_impl.g.dart';

@riverpod
WifiServerRepository wifiServerRepository(Ref ref) {
  return WifiServerRepositoryImpl();
}

class WifiServerRepositoryImpl implements WifiServerRepository {
  HttpServer? _httpServer;
  Registration? _registration;
  final _clients = <WebSocketChannel>[];
  final _messageController = StreamController<String>.broadcast();
  final _connectedCountController = StreamController<int>.broadcast();

  @override
  Future<void> start({required String serviceName, required int port}) async {
    // 前回のサーバーが残っていれば停止する
    await stop();

    // WebSocket サーバーを起動
    final handler = webSocketHandler((webSocket, _) {
      _clients.add(webSocket);
      _connectedCountController.add(_clients.length);
      log('クライアント接続: ${_clients.length}台');

      webSocket.stream.listen(
        (message) {
          if (message is String) {
            _messageController.add(message);
          }
        },
        onDone: () {
          _clients.remove(webSocket);
          _connectedCountController.add(_clients.length);
          log('クライアント切断: ${_clients.length}台');
        },
        onError: (Object error) {
          _clients.remove(webSocket);
          _connectedCountController.add(_clients.length);
          log('クライアントエラー: $error');
        },
      );
    });

    _httpServer = await shelf_io.serve(handler, InternetAddress.anyIPv4, port);
    final actualPort = _httpServer!.port;
    log('WebSocket サーバー起動: port $actualPort');

    // mDNS にサービスを登録（実際に割り当てられたポートを使う）
    _registration = await register(
      Service(name: serviceName, type: '_playground._tcp', port: actualPort),
    );
    log('mDNS サービス登録: $serviceName (port $actualPort)');
  }

  @override
  Future<void> stop() async {
    // mDNS 登録解除
    final registration = _registration;
    if (registration != null) {
      await unregister(registration);
      _registration = null;
      log('mDNS サービス登録解除');
    }

    // 全クライアント切断（コピーしてからループ。close で onDone → remove が走るため）
    final clientsCopy = List.of(_clients);
    _clients.clear();
    for (final client in clientsCopy) {
      await client.sink.close();
    }
    _connectedCountController.add(0);

    // サーバー停止
    await _httpServer?.close();
    _httpServer = null;
    log('WebSocket サーバー停止');
  }

  @override
  Stream<String> get messageStream => _messageController.stream;

  @override
  void sendMessage(String message) {
    for (final client in _clients) {
      client.sink.add(message);
    }
  }

  @override
  Stream<int> get connectedClientCountStream =>
      _connectedCountController.stream;
}
