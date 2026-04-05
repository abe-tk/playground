import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/feature/ble/application/state/counter_remote_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_connection_state.dart';
import 'package:playground/feature/ble/domain/entity/counter_command.dart';

class CounterRemotePage extends ConsumerWidget {
  const CounterRemotePage({required this.deviceId, super.key});

  final String deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remoteState = ref.watch(counterRemoteProvider(deviceId));
    final notifier = ref.read(counterRemoteProvider(deviceId).notifier);
    final isConnected =
        remoteState.connectionState == BleConnectionState.connected;

    return Scaffold(
      appBar: AppBar(
        title: const Text('リモコン'),
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
                if (!isConnected && !remoteState.isLoading)
                  FilledButton(
                    onPressed: notifier.connect,
                    child: const Text('接続'),
                  ),
                if (remoteState.isLoading)
                  const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
          ),
          if (remoteState.error != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade50,
              child: Text(
                remoteState.error!,
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
          const Divider(height: 1),
          // カウンター表示
          Expanded(
            child: Center(
              child: Text(
                remoteState.currentValue?.toString() ?? '-',
                style: TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                  color: isConnected ? null : Colors.grey,
                ),
              ),
            ),
          ),
          // 操作ボタン
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Expanded(
                  child: _CommandButton(
                    label: '-1',
                    icon: Icons.remove,
                    onPressed: isConnected
                        ? () => notifier.sendCommand(CounterCommand.decrement)
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _CommandButton(
                    label: 'Reset',
                    icon: Icons.refresh,
                    onPressed: isConnected
                        ? () => notifier.sendCommand(CounterCommand.reset)
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _CommandButton(
                    label: '+1',
                    icon: Icons.add,
                    onPressed: isConnected
                        ? () => notifier.sendCommand(CounterCommand.increment)
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CommandButton extends StatelessWidget {
  const _CommandButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: FilledButton.tonalIcon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          label,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
