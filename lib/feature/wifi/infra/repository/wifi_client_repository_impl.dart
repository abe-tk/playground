import 'dart:async';
import 'dart:developer';

import 'package:nsd/nsd.dart';
import 'package:playground/feature/wifi/domain/entity/wifi_device.dart';
import 'package:playground/feature/wifi/domain/repository/wifi_client_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'wifi_client_repository_impl.g.dart';

@riverpod
WifiClientRepository wifiClientRepository(Ref ref) {
  return WifiClientRepositoryImpl();
}

class WifiClientRepositoryImpl implements WifiClientRepository {
  Discovery? _discovery;
  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _channelSub;
  final _messageController = StreamController<String>.broadcast();
  final _devicesController = StreamController<List<WifiDevice>>.broadcast();
  final _devices = <String, WifiDevice>{};

  @override
  Stream<List<WifiDevice>> get discoveredDevices => _devicesController.stream;

  @override
  Future<void> startDiscovery() async {
    _devices.clear();

    _discovery = await startNsdDiscovery('_playground._tcp');
    _discovery!.addServiceListener((service, status) {
      final name = service.name;
      final host = service.host;
      final port = service.port;

      if (name == null || host == null || port == null) return;

      if (status == ServiceStatus.found) {
        _devices[name] = WifiDevice(name: name, host: host, port: port);
        log('サービス発見: $name ($host:$port)');
      } else {
        _devices.remove(name);
        log('サービス消失: $name');
      }
      _devicesController.add(_devices.values.toList());
    });
  }

  @override
  Future<void> stopDiscovery() async {
    final discovery = _discovery;
    if (discovery != null) {
      await stopNsdDiscovery(discovery);
      _discovery = null;
    }
    _devices.clear();
  }

  @override
  Future<void> connect({required String host, required int port}) async {
    disconnect();

    final uri = Uri.parse('ws://$host:$port');
    _channel = WebSocketChannel.connect(uri);
    await _channel!.ready;
    log('WebSocket 接続: $uri');

    _channelSub = _channel!.stream.listen(
      (message) {
        if (message is String) {
          _messageController.add(message);
        }
      },
      onDone: () {
        log('WebSocket 切断');
        _channel = null;
        _channelSub = null;
      },
      onError: (Object error) {
        log('WebSocket エラー: $error');
        _channel = null;
        _channelSub = null;
      },
    );
  }

  @override
  void disconnect() {
    unawaited(_channelSub?.cancel());
    _channelSub = null;
    unawaited(_channel?.sink.close());
    _channel = null;
  }

  @override
  Stream<String> get messageStream => _messageController.stream;

  @override
  void sendMessage(String message) {
    _channel?.sink.add(message);
  }
}

/// nsd パッケージの Discovery 開始ラッパー
Future<Discovery> startNsdDiscovery(String serviceType) async {
  return startDiscovery(serviceType);
}

/// nsd パッケージの Discovery 停止ラッパー
Future<void> stopNsdDiscovery(Discovery discovery) async {
  return stopDiscovery(discovery);
}
