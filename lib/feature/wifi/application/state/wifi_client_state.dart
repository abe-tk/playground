import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'package:playground/feature/wifi/domain/entity/chat_message.dart';
import 'package:playground/feature/wifi/domain/entity/wifi_connection_state.dart';
import 'package:playground/feature/wifi/domain/entity/wifi_device.dart';
import 'package:playground/feature/wifi/infra/repository/wifi_client_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wifi_client_state.freezed.dart';
part 'wifi_client_state.g.dart';

@freezed
abstract class WifiClientState with _$WifiClientState {
  const factory WifiClientState({
    @Default([]) List<WifiDevice> devices,
    @Default(false) bool isDiscovering,
    @Default(WifiConnectionState.disconnected)
    WifiConnectionState connectionState,
    @Default(false) bool isLoading,
    @Default([]) List<ChatMessage> messages,
    String? error,
  }) = _WifiClientState;
}

@riverpod
class WifiClientNotifier extends _$WifiClientNotifier {
  StreamSubscription<List<WifiDevice>>? _discoverySub;
  StreamSubscription<String>? _messageSub;

  @override
  WifiClientState build() {
    // Repository を watch して auto-dispose を防ぐ
    ref
      ..watch(wifiClientRepositoryProvider)
      ..onDispose(() {
        unawaited(_discoverySub?.cancel());
        unawaited(_messageSub?.cancel());
      });

    return const WifiClientState();
  }

  Future<void> startDiscovery() async {
    final repository = ref.read(wifiClientRepositoryProvider);
    state = state.copyWith(error: null);

    try {
      await repository.startDiscovery();

      unawaited(_discoverySub?.cancel());
      _discoverySub = repository.discoveredDevices.listen((devices) {
        state = state.copyWith(devices: devices);
      });

      state = state.copyWith(isDiscovering: true);
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> stopDiscovery() async {
    final repository = ref.read(wifiClientRepositoryProvider);
    try {
      await repository.stopDiscovery();
      unawaited(_discoverySub?.cancel());
      _discoverySub = null;
      state = state.copyWith(isDiscovering: false, devices: []);
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  Future<void> connect({required String host, required int port}) async {
    final repository = ref.read(wifiClientRepositoryProvider);
    state = state.copyWith(error: null, isLoading: true);

    try {
      await repository.connect(host: host, port: port);

      // メッセージ受信を監視
      unawaited(_messageSub?.cancel());
      _messageSub = repository.messageStream.listen(
        (message) {
          state = state.copyWith(
            messages: [
              ...state.messages,
              ChatMessage(
                text: message,
                isMe: false,
                timestamp: DateTime.now(),
              ),
            ],
          );
        },
        onDone: () {
          state = state.copyWith(
            connectionState: WifiConnectionState.disconnected,
          );
        },
      );

      state = state.copyWith(
        connectionState: WifiConnectionState.connected,
        isLoading: false,
      );
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  void disconnect() {
    ref.read(wifiClientRepositoryProvider).disconnect();
    unawaited(_messageSub?.cancel());
    _messageSub = null;
    state = state.copyWith(
      connectionState: WifiConnectionState.disconnected,
      messages: [],
    );
  }

  void sendMessage(String text) {
    if (text.isEmpty) return;
    ref.read(wifiClientRepositoryProvider).sendMessage(text);
    state = state.copyWith(
      messages: [
        ...state.messages,
        ChatMessage(text: text, isMe: true, timestamp: DateTime.now()),
      ],
    );
  }
}
