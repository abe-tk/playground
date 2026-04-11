import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/feature/wifi/application/state/wifi_client_state.dart';
import 'package:playground/feature/wifi/domain/entity/wifi_connection_state.dart';

class WifiClientPage extends HookConsumerWidget {
  const WifiClientPage({required this.host, required this.port, super.key});

  final String host;
  final int port;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientState = ref.watch(wifiClientProvider);
    final notifier = ref.read(wifiClientProvider.notifier);
    final textController = useTextEditingController();
    final scrollController = useScrollController();
    final isConnected =
        clientState.connectionState == WifiConnectionState.connected;

    // 初回接続（ビルド完了後に実行）
    useEffect(
      () {
        unawaited(
          Future.microtask(
            () => notifier.connect(host: host, port: port),
          ),
        );
        return notifier.disconnect;
      },
      [],
    );

    // メッセージ追加時に自動スクロール
    ref.listen(wifiClientProvider.select((s) => s.messages.length), (_, _) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (scrollController.hasClients) {
          unawaited(
            scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            ),
          );
        }
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('$host:$port'),
        actions: [
          if (isConnected)
            IconButton(
              onPressed: notifier.disconnect,
              icon: const Icon(Icons.link_off),
            ),
        ],
      ),
      body: Column(
        children: [
          // 接続状態
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  isConnected ? Icons.link : Icons.link_off,
                  color: isConnected ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(isConnected ? '接続中' : '未接続'),
                const Spacer(),
                if (!isConnected && !clientState.isLoading)
                  FilledButton(
                    onPressed: () => notifier.connect(host: host, port: port),
                    child: const Text('再接続'),
                  ),
                if (clientState.isLoading)
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
          ),
          if (clientState.error != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade50,
              child: Text(
                clientState.error!,
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
          const Divider(height: 1),
          // メッセージ一覧
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: clientState.messages.length,
              itemBuilder: (context, index) {
                final message = clientState.messages[index];
                return _ChatBubble(text: message.text, isMe: message.isMe);
              },
            ),
          ),
          // 入力欄
          if (isConnected)
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: const InputDecoration(
                          hintText: 'メッセージを入力',
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                        onSubmitted: (_) {
                          notifier.sendMessage(textController.text);
                          textController.clear();
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton.filled(
                      onPressed: () {
                        notifier.sendMessage(textController.text);
                        textController.clear();
                      },
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({required this.text, required this.isMe});

  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isMe
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(text),
      ),
    );
  }
}
