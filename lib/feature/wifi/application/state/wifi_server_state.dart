import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart' hide protected;
import 'package:playground/feature/wifi/domain/entity/chat_message.dart';
import 'package:playground/feature/wifi/infra/repository/wifi_server_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wifi_server_state.freezed.dart';
part 'wifi_server_state.g.dart';

@freezed
abstract class WifiServerState with _$WifiServerState {
  const factory WifiServerState({
    @Default(false) bool isRunning,
    @Default(false) bool isLoading,
    @Default(0) int connectedClientCount,
    @Default([]) List<ChatMessage> messages,
    String? error,
  }) = _WifiServerState;
}

@riverpod
class WifiServerNotifier extends _$WifiServerNotifier {
  StreamSubscription<String>? _messageSub;
  StreamSubscription<int>? _clientCountSub;

  @override
  WifiServerState build() {
    // Repository を watch して auto-dispose を防ぐ
    ref
      ..watch(wifiServerRepositoryProvider)
      ..onDispose(() {
        unawaited(_messageSub?.cancel());
        unawaited(_clientCountSub?.cancel());
      });

    return const WifiServerState();
  }

  Future<void> startServer({required String serviceName}) async {
    final repository = ref.read(wifiServerRepositoryProvider);
    state = state.copyWith(error: null, isLoading: true);

    try {
      // ポートは 0 を指定して OS に空きポートを自動割り当てさせる
      await repository.start(serviceName: serviceName, port: 0);

      // メッセージ受信を監視
      unawaited(_messageSub?.cancel());
      _messageSub = repository.messageStream.listen((message) {
        state = state.copyWith(
          messages: [
            ...state.messages,
            ChatMessage(text: message, isMe: false, timestamp: DateTime.now()),
          ],
        );
      });

      // 接続クライアント数を監視
      unawaited(_clientCountSub?.cancel());
      _clientCountSub = repository.connectedClientCountStream.listen((count) {
        state = state.copyWith(connectedClientCount: count);
      });

      state = state.copyWith(isRunning: true, isLoading: false);
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString(), isLoading: false);
    }
  }

  Future<void> stopServer() async {
    final repository = ref.read(wifiServerRepositoryProvider);
    try {
      await repository.stop();
      unawaited(_messageSub?.cancel());
      _messageSub = null;
      unawaited(_clientCountSub?.cancel());
      _clientCountSub = null;
      state = const WifiServerState();
    } on Exception catch (e) {
      state = state.copyWith(error: e.toString());
    }
  }

  void sendMessage(String text) {
    if (text.isEmpty) return;
    ref.read(wifiServerRepositoryProvider).sendMessage(text);
    state = state.copyWith(
      messages: [
        ...state.messages,
        ChatMessage(text: text, isMe: true, timestamp: DateTime.now()),
      ],
    );
  }
}
