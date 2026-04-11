import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/feature/wifi/application/state/wifi_client_state.dart';
import 'package:playground/router/route.dart';

class WifiBrowserPage extends ConsumerWidget {
  const WifiBrowserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clientState = ref.watch(wifiClientProvider);
    final notifier = ref.read(wifiClientProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wi-Fi'),
        actions: [
          // サーバーモードへの導線
          IconButton(
            onPressed: () => const WifiServerRoute().go(context),
            icon: const Icon(Icons.dns),
            tooltip: 'サーバーとして起動',
          ),
        ],
      ),
      body: Column(
        children: [
          // スキャン状態
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  clientState.isDiscovering ? Icons.radar : Icons.wifi_find,
                  color: clientState.isDiscovering ? Colors.blue : Colors.grey,
                ),
                const SizedBox(width: 8),
                Text(
                  clientState.isDiscovering
                      ? '検索中... ${clientState.devices.length} 台発見'
                      : '停止中',
                ),
                const Spacer(),
                FilledButton(
                  onPressed: clientState.isDiscovering
                      ? notifier.stopDiscovery
                      : notifier.startDiscovery,
                  child: Text(clientState.isDiscovering ? '停止' : '検索開始'),
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
          // デバイス一覧
          Expanded(
            child: clientState.devices.isEmpty
                ? Center(
                    child: Text(
                      clientState.isDiscovering
                          ? 'サービスを検索しています...'
                          : '「検索開始」を押してください',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: clientState.devices.length,
                    itemBuilder: (context, index) {
                      final device = clientState.devices[index];
                      return ListTile(
                        leading: const Icon(Icons.devices),
                        title: Text(device.name),
                        subtitle: Text('${device.host}:${device.port}'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () => WifiClientRoute(
                          host: device.host,
                          port: device.port,
                        ).go(context),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
