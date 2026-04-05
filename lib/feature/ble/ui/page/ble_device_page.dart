import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:playground/feature/ble/application/state/ble_device_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_characteristic_property.dart';
import 'package:playground/feature/ble/domain/entity/ble_connection_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_gatt_characteristic.dart';
import 'package:playground/feature/ble/domain/entity/ble_gatt_service.dart';

class BleDevicePage extends ConsumerWidget {
  const BleDevicePage({required this.deviceId, super.key});

  final String deviceId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceState = ref.watch(bleDeviceProvider(deviceId));
    final notifier = ref.read(bleDeviceProvider(deviceId).notifier);
    final isConnected =
        deviceState.connectionState == BleConnectionState.connected;

    return Scaffold(
      appBar: AppBar(
        title: Text(isConnected ? 'GATT ブラウザ' : 'デバイス詳細'),
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
          _ConnectionBar(
            isConnected: isConnected,
            isLoading: deviceState.isLoading,
            onConnect: notifier.connect,
            onDisconnect: notifier.disconnect,
          ),
          // エラー表示
          if (deviceState.error != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade50,
              child: Text(
                deviceState.error!,
                style: TextStyle(color: Colors.red.shade700),
              ),
            ),
          // 読み取り結果
          if (deviceState.readValue != null)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.blue.shade50,
              child: Text(
                deviceState.readValue!,
                style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
              ),
            ),
          const Divider(height: 1),
          // サービス一覧
          Expanded(
            child: deviceState.services.isEmpty
                ? Center(
                    child: Text(
                      isConnected ? 'サービスを取得中...' : '接続してください',
                    ),
                  )
                : _ServiceList(
                    services: deviceState.services,
                    onRead: (serviceUuid, charUuid) =>
                        notifier.readCharacteristic(
                          serviceUuid: serviceUuid,
                          characteristicUuid: charUuid,
                        ),
                  ),
          ),
        ],
      ),
    );
  }
}

class _ConnectionBar extends StatelessWidget {
  const _ConnectionBar({
    required this.isConnected,
    required this.isLoading,
    required this.onConnect,
    required this.onDisconnect,
  });

  final bool isConnected;
  final bool isLoading;
  final VoidCallback onConnect;
  final VoidCallback onDisconnect;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          if (isLoading)
            const SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else
            FilledButton(
              onPressed: isConnected ? onDisconnect : onConnect,
              child: Text(isConnected ? '切断' : '接続'),
            ),
        ],
      ),
    );
  }
}

class _ServiceList extends StatelessWidget {
  const _ServiceList({
    required this.services,
    required this.onRead,
  });

  final List<BleGattService> services;
  final void Function(String serviceUuid, String characteristicUuid) onRead;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return _ServiceTile(service: service, onRead: onRead);
      },
    );
  }
}

class _ServiceTile extends StatelessWidget {
  const _ServiceTile({
    required this.service,
    required this.onRead,
  });

  final BleGattService service;
  final void Function(String serviceUuid, String characteristicUuid) onRead;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: const Icon(Icons.account_tree),
      title: Text(
        _shortenUuid(service.uuid),
        style: const TextStyle(fontFamily: 'monospace', fontSize: 14),
      ),
      subtitle: Text(
        '${service.isPrimary ? "Primary" : "Secondary"}'
        ' · ${service.characteristics.length} characteristics',
      ),
      children: service.characteristics
          .map(
            (c) => _CharacteristicTile(
              characteristic: c,
              onRead: () => onRead(service.uuid, c.uuid),
            ),
          )
          .toList(),
    );
  }
}

class _CharacteristicTile extends StatelessWidget {
  const _CharacteristicTile({
    required this.characteristic,
    required this.onRead,
  });

  final BleGattCharacteristic characteristic;
  final VoidCallback onRead;

  @override
  Widget build(BuildContext context) {
    final canRead = characteristic.properties.contains(
      BleCharacteristicProperty.read,
    );

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 32),
      title: Text(
        _shortenUuid(characteristic.uuid),
        style: const TextStyle(fontFamily: 'monospace', fontSize: 13),
      ),
      subtitle: Wrap(
        spacing: 4,
        children: characteristic.properties.map(_propertyChip).toList(),
      ),
      trailing: canRead
          ? IconButton(
              onPressed: onRead,
              icon: const Icon(Icons.download),
              tooltip: 'Read',
            )
          : null,
    );
  }

  Widget _propertyChip(BleCharacteristicProperty property) {
    final (label, color) = switch (property) {
      BleCharacteristicProperty.read => ('R', Colors.blue),
      BleCharacteristicProperty.write => ('W', Colors.orange),
      BleCharacteristicProperty.writeWithoutResponse => ('WnR', Colors.amber),
      BleCharacteristicProperty.notify => ('N', Colors.green),
      BleCharacteristicProperty.indicate => ('I', Colors.teal),
    };
    return Chip(
      label: Text(label, style: TextStyle(color: color, fontSize: 11)),
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
    );
  }
}

/// 標準的な 128bit BLE UUID を短縮表示する
/// 例: "0000180f-0000-1000-8000-00805f9b34fb" → "0x180F"
String _shortenUuid(String uuid) {
  const baseSuffix = '-0000-1000-8000-00805f9b34fb';
  if (uuid.toLowerCase().endsWith(baseSuffix) && uuid.length == 36) {
    final short = uuid.substring(4, 8).toUpperCase();
    return '0x$short';
  }
  return uuid;
}
