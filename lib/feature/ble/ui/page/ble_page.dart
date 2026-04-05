import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/feature/ble/application/state/ble_scan_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_constants.dart';
import 'package:playground/feature/ble/domain/entity/ble_device.dart';
import 'package:playground/router/route.dart';

class BlePage extends ConsumerWidget {
  const BlePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scanState = ref.watch(bleScanProvider);
    final notifier = ref.read(bleScanProvider.notifier);
    final isPoweredOn = scanState.adapterState == BleAdapterState.poweredOn;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BLE スキャン'),
        actions: [
          IconButton(
            onPressed: () => const CounterDisplayRoute().push<void>(context),
            icon: const Icon(Icons.gamepad),
            tooltip: 'カウンターデモ',
          ),
          IconButton(
            onPressed: () => const BlePeripheralRoute().push<void>(context),
            icon: const Icon(Icons.cell_tower),
            tooltip: 'Peripheral モード',
          ),
        ],
      ),
      body: Column(
        children: [
          _AdapterStateBar(
            adapterState: scanState.adapterState,
            onAuthorize: notifier.authorize,
          ),
          const Divider(height: 1),
          Expanded(
            child: scanState.devices.isEmpty
                ? Center(
                    child: Text(
                      scanState.isScanning ? 'スキャン中...' : 'デバイスが見つかりません',
                    ),
                  )
                : ListView.builder(
                    itemCount: scanState.devices.length,
                    itemBuilder: (context, index) {
                      final device = scanState.devices[index];
                      return _DeviceTile(device: device);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: isPoweredOn
            ? (scanState.isScanning ? notifier.stopScan : notifier.startScan)
            : null,
        icon: Icon(scanState.isScanning ? Icons.stop : Icons.search),
        label: Text(scanState.isScanning ? 'スキャン停止' : 'スキャン開始'),
      ),
    );
  }
}

class _DeviceTile extends StatelessWidget {
  const _DeviceTile({required this.device});

  final BleDevice device;

  @override
  Widget build(BuildContext context) {
    // Service UUID または デバイス名のプレフィックスで判定
    // iOS はフィルタなしスキャンで serviceUUIDs を返さない場合がある
    final isPlayground =
        device.serviceUuids.contains(bleServiceUuid) ||
        (device.name?.startsWith(bleAdvertiseName) ?? false);
    final isCounter =
        device.serviceUuids.contains(counterServiceUuid) ||
        (device.name?.startsWith(counterAdvertiseName) ?? false);
    final isOurApp = isPlayground || isCounter;

    return ListTile(
      leading: Icon(
        isOurApp ? Icons.phone_android : Icons.bluetooth,
        color: isOurApp ? Colors.green : null,
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(device.name ?? '不明なデバイス'),
          ),
          if (isCounter)
            const _Badge(label: 'Counter', color: Colors.orange)
          else if (isPlayground)
            const _Badge(label: 'Playground', color: Colors.green),
        ],
      ),
      subtitle: Text(
        'RSSI: ${device.rssi} dBm\nID: ${device.id}',
      ),
      isThreeLine: true,
      trailing: const Icon(Icons.chevron_right),
      onTap: () async {
        if (isCounter) {
          await CounterRemoteRoute(deviceId: device.id).push<void>(context);
        } else {
          await BleDeviceRoute(deviceId: device.id).push<void>(context);
        }
      },
    );
  }
}

class _AdapterStateBar extends StatelessWidget {
  const _AdapterStateBar({
    required this.adapterState,
    required this.onAuthorize,
  });

  final BleAdapterState adapterState;
  final VoidCallback onAuthorize;

  @override
  Widget build(BuildContext context) {
    final isPoweredOn = adapterState == BleAdapterState.poweredOn;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(
            isPoweredOn ? Icons.bluetooth : Icons.bluetooth_disabled,
            color: isPoweredOn ? Colors.blue : Colors.grey,
          ),
          const SizedBox(width: 8),
          Text('Bluetooth: ${adapterState.name}'),
          const Spacer(),
          if (adapterState == BleAdapterState.unauthorized)
            TextButton(
              onPressed: onAuthorize,
              child: const Text('権限を許可'),
            ),
        ],
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge({required this.label, required this.color});

  final String label;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: color.shade100,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 11, color: color.shade800),
      ),
    );
  }
}
