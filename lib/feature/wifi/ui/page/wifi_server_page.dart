import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/feature/wifi/application/state/wifi_server_state.dart';

class WifiServerPage extends HookConsumerWidget {
  const WifiServerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverState = ref.watch(wifiServerProvider);
    final notifier = ref.read(wifiServerProvider.notifier);
    final textController = useTextEditingController();
    final scrollController = useScrollController();

    // メッセージ追加時に自動スクロール
    ref.listen(wifiServerProvider.select((s) => s.messages.length), (_, _) {
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
        title: const Text('サーバー'),
        actions: [
          if (serverState.isRunning)
            IconButton(
              onPressed: notifier.stopServer,
              icon: const Icon(Icons.stop),
            ),
        ],
      ),
      body: Column(
        children: [
          // 状態表示
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  serverState.isRunning ? Icons.wifi : Icons.wifi_off,
                  color: serverState.isRunning ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  serverState.isRunning
                      ? '待機中 · ${serverState.connectedClientCount} 台接続'
                      : '停止中',
                ),
              ],
            ),
          ),
          if (serverState.error != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade50,
              child: Text(
                serverState.error!,
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
          const Divider(height: 1),
          if (!serverState.isRunning)
            Expanded(
              child: Center(
                child: serverState.isLoading
                    ? const CircularProgressIndicator()
                    : FilledButton.icon(
                        onPressed: () => notifier.startServer(
                          serviceName: 'Playground ${Platform.localHostname}',
                        ),
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('サーバー起動'),
                      ),
              ),
            )
          else ...[
            // メッセージ一覧
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: serverState.messages.length,
                itemBuilder: (context, index) {
                  final message = serverState.messages[index];
                  return _ChatBubble(
                    text: message.text,
                    isMe: message.isMe,
                  );
                },
              ),
            ),
            // 入力欄
            _MessageInput(
              controller: textController,
              onSend: () {
                notifier.sendMessage(textController.text);
                textController.clear();
              },
            ),
          ],
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

class _MessageInput extends StatelessWidget {
  const _MessageInput({required this.controller, required this.onSend});

  final TextEditingController controller;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'メッセージを入力',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                onSubmitted: (_) => onSend(),
              ),
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              onPressed: onSend,
              icon: const Icon(Icons.send),
            ),
          ],
        ),
      ),
    );
  }
}
