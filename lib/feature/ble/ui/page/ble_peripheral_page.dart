import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/feature/ble/application/state/ble_peripheral_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_constants.dart';

class BlePeripheralPage extends ConsumerWidget {
  const BlePeripheralPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final peripheralState = ref.watch(blePeripheralProvider);
    final notifier = ref.read(blePeripheralProvider.notifier);
    final isPoweredOn =
        peripheralState.adapterState == BleAdapterState.poweredOn;

    return Scaffold(
      appBar: AppBar(title: const Text('Peripheral モード')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // BLE 状態
          _StatusCard(
            icon: isPoweredOn ? Icons.bluetooth : Icons.bluetooth_disabled,
            iconColor: isPoweredOn ? Colors.blue : Colors.grey,
            title: 'Bluetooth',
            value: peripheralState.adapterState.name,
          ),
          const SizedBox(height: 12),

          // アドバタイズ状態
          _StatusCard(
            icon: peripheralState.isAdvertising
                ? Icons.cell_tower
                : Icons.portable_wifi_off,
            iconColor: peripheralState.isAdvertising
                ? Colors.green
                : Colors.grey,
            title: 'アドバタイズ',
            value: peripheralState.isAdvertising ? '発信中' : '停止',
          ),
          const SizedBox(height: 12),

          // 接続数
          if (peripheralState.isAdvertising) ...[
            _StatusCard(
              icon: Icons.devices,
              iconColor: peripheralState.connectedCentralCount > 0
                  ? Colors.green
                  : Colors.grey,
              title: '接続中の Central',
              value: '${peripheralState.connectedCentralCount} 台',
            ),
            const SizedBox(height: 12),
          ],

          // エラー
          if (peripheralState.error != null) ...[
            Card(
              color: Colors.red.shade50,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  peripheralState.error!,
                  style: TextStyle(color: Colors.red.shade700),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],

          const Divider(),
          const SizedBox(height: 8),

          // UUID 情報
          Text(
            'Service UUID',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 4),
          const _CopyableText(text: bleServiceUuid),
          const SizedBox(height: 12),

          Text(
            'Characteristic UUID',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(height: 4),
          const _CopyableText(text: bleCharacteristicUuid),
          const SizedBox(height: 8),

          Text(
            '別のデバイスから上記の Service UUID を持つ '
            'デバイスをスキャンして接続し、\n'
            'Characteristic を Read すると '
            'このデバイスの名前が返ります。',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 24),

          // アドバタイズ開始/停止ボタン
          if (peripheralState.isLoading)
            const Center(child: CircularProgressIndicator())
          else
            FilledButton.icon(
              onPressed:
                  peripheralState.adapterState != BleAdapterState.unsupported &&
                      peripheralState.adapterState != BleAdapterState.poweredOff
                  ? (peripheralState.isAdvertising
                        ? notifier.stopAdvertising
                        : notifier.startAdvertising)
                  : null,
              icon: Icon(
                peripheralState.isAdvertising ? Icons.stop : Icons.cell_tower,
              ),
              label: Text(
                peripheralState.isAdvertising ? 'アドバタイズ停止' : 'アドバタイズ開始',
              ),
            ),
        ],
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  const _StatusCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: iconColor),
        title: Text(title),
        trailing: Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

class _CopyableText extends StatelessWidget {
  const _CopyableText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final messenger = ScaffoldMessenger.of(context);
        await Clipboard.setData(ClipboardData(text: text));
        messenger.showSnackBar(
          const SnackBar(
            content: Text('コピーしました'),
            duration: Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                ),
              ),
            ),
            const Icon(Icons.copy, size: 16),
          ],
        ),
      ),
    );
  }
}
