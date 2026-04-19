import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/feature/nfc/application/state/nfc_state.dart';
import 'package:playground/feature/nfc/domain/entity/nfc_record.dart';
import 'package:playground/feature/nfc/domain/repository/nfc_repository.dart';

enum _WriteMode { text, uri }

class NfcPage extends HookConsumerWidget {
  const NfcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nfcState = ref.watch(nfcProvider);
    final notifier = ref.read(nfcProvider.notifier);
    final textController = useTextEditingController();
    final uriController = useTextEditingController();
    final writeMode = useState(_WriteMode.text);

    // 画面表示時に可用性チェック
    useEffect(
      () {
        unawaited(Future.microtask(notifier.checkAvailability));
        return null;
      },
      [],
    );

    final isBusy = nfcState.isReading || nfcState.isWriting;

    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC'),
        actions: [
          if (isBusy)
            IconButton(
              onPressed: notifier.stopSession,
              icon: const Icon(Icons.stop_circle),
              tooltip: 'セッション停止',
            ),
        ],
      ),
      body: _body(
        context,
        nfcState,
        notifier,
        textController,
        uriController,
        writeMode,
      ),
    );
  }

  Widget _body(
    BuildContext context,
    NfcState nfcState,
    NfcNotifier notifier,
    TextEditingController textController,
    TextEditingController uriController,
    ValueNotifier<_WriteMode> writeMode,
  ) {
    if (nfcState.availability == NfcAvailability.unsupported) {
      return const _CenteredMessage(
        icon: Icons.error_outline,
        text: 'この端末は NFC に対応していません',
      );
    }
    if (nfcState.availability == NfcAvailability.disabled) {
      return const _CenteredMessage(
        icon: Icons.nfc,
        text: 'NFC が OFF になっています。設定から ON にしてください',
      );
    }

    final isBusy = nfcState.isReading || nfcState.isWriting;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // エラー表示
        if (nfcState.error != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              nfcState.error!,
              style: TextStyle(color: Colors.red.shade700),
            ),
          ),

        // 書き込み成功メッセージ
        if (nfcState.writeResult != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              nfcState.writeResult!,
              style: TextStyle(color: Colors.green.shade800),
            ),
          ),

        // ---- 読み取りセクション ----
        Text('読み取り', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        FilledButton.icon(
          onPressed: isBusy ? null : notifier.readTag,
          icon: nfcState.isReading
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.wifi_tethering),
          label: Text(nfcState.isReading ? 'タグをかざしてください...' : '読み取り開始'),
        ),
        const SizedBox(height: 12),
        if (nfcState.readRecords.isEmpty && !nfcState.isReading)
          Text(
            '読み取り結果はまだありません',
            style: TextStyle(color: Colors.grey.shade600),
          )
        else
          ...nfcState.readRecords.map(_RecordTile.new),

        const SizedBox(height: 24),
        const Divider(),
        const SizedBox(height: 24),

        // ---- 書き込みセクション ----
        Text('書き込み', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        SegmentedButton<_WriteMode>(
          segments: const [
            ButtonSegment(
              value: _WriteMode.text,
              label: Text('テキスト'),
              icon: Icon(Icons.text_fields),
            ),
            ButtonSegment(
              value: _WriteMode.uri,
              label: Text('URI'),
              icon: Icon(Icons.link),
            ),
          ],
          selected: {writeMode.value},
          onSelectionChanged: (set) => writeMode.value = set.first,
        ),
        const SizedBox(height: 12),
        if (writeMode.value == _WriteMode.text)
          TextField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: 'テキスト',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          )
        else
          TextField(
            controller: uriController,
            decoration: const InputDecoration(
              labelText: 'URI（例: https://example.com/）',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.url,
          ),
        const SizedBox(height: 12),
        FilledButton.icon(
          onPressed: isBusy
              ? null
              : () => _onWrite(
                  notifier,
                  writeMode.value,
                  textController,
                  uriController,
                ),
          icon: nfcState.isWriting
              ? const SizedBox(
                  width: 18,
                  height: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(Icons.edit),
          label: Text(nfcState.isWriting ? 'タグをかざしてください...' : '書き込み開始'),
        ),
      ],
    );
  }

  void _onWrite(
    NfcNotifier notifier,
    _WriteMode mode,
    TextEditingController textController,
    TextEditingController uriController,
  ) {
    if (mode == _WriteMode.text) {
      unawaited(notifier.writeText(textController.text));
      return;
    }
    final uriString = uriController.text.trim();
    final uri = Uri.tryParse(uriString);
    if (uri == null || uriString.isEmpty) {
      return;
    }
    unawaited(notifier.writeUri(uri));
  }
}

class _RecordTile extends StatelessWidget {
  const _RecordTile(this.record);

  final NfcRecord record;

  @override
  Widget build(BuildContext context) {
    final (icon, label) = switch (record.kind) {
      NfcRecordKind.text => (Icons.text_snippet, 'テキスト'),
      NfcRecordKind.uri => (Icons.link, 'URI'),
      NfcRecordKind.other => (Icons.data_object, 'その他'),
    };
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon),
        title: Text(label),
        subtitle: Text(record.payload),
        isThreeLine: record.payload.length > 40,
      ),
    );
  }
}

class _CenteredMessage extends StatelessWidget {
  const _CenteredMessage({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
