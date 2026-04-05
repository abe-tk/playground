import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/feature/ble/application/state/counter_display_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';

class CounterDisplayPage extends ConsumerWidget {
  const CounterDisplayPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayState = ref.watch(counterDisplayProvider);
    final notifier = ref.read(counterDisplayProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('カウンター（表示側）')),
      body: Column(
        children: [
          // 状態表示
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  displayState.isAdvertising
                      ? Icons.cell_tower
                      : Icons.portable_wifi_off,
                  color: displayState.isAdvertising
                      ? Colors.green
                      : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  displayState.isAdvertising
                      ? '待機中 · ${displayState.connectedCentralCount} 台接続'
                      : '停止中',
                ),
              ],
            ),
          ),
          if (displayState.error != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade50,
              child: Text(
                displayState.error!,
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
          const Divider(height: 1),
          // カウンター
          Expanded(
            child: Center(
              child: Text(
                '${displayState.counter}',
                style: const TextStyle(
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // ボタン
          Padding(
            padding: const EdgeInsets.all(24),
            child: displayState.isLoading
                ? const CircularProgressIndicator()
                : SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed:
                          displayState.adapterState !=
                                  BleAdapterState.unsupported &&
                              displayState.adapterState !=
                                  BleAdapterState.poweredOff
                          ? (displayState.isAdvertising
                                ? notifier.stopAdvertising
                                : notifier.startAdvertising)
                          : null,
                      icon: Icon(
                        displayState.isAdvertising
                            ? Icons.stop
                            : Icons.cell_tower,
                      ),
                      label: Text(
                        displayState.isAdvertising ? '停止' : '待機開始',
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
