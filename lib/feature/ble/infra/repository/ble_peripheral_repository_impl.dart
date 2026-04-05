import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:bluetooth_low_energy/bluetooth_low_energy.dart'
    hide ConnectionState;
import 'package:bluetooth_low_energy/bluetooth_low_energy.dart'
    as ble
    show ConnectionState;
import 'package:permission_handler/permission_handler.dart';
import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_characteristic_property.dart'
    as domain;
import 'package:playground/feature/ble/domain/repository/ble_peripheral_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ble_peripheral_repository_impl.g.dart';

@riverpod
BlePeripheralRepository blePeripheralRepository(Ref ref) {
  return BlePeripheralRepositoryImpl();
}

class BlePeripheralRepositoryImpl implements BlePeripheralRepository {
  BlePeripheralRepositoryImpl() : _peripheralManager = PeripheralManager();

  final PeripheralManager _peripheralManager;
  StreamSubscription<GATTCharacteristicReadRequestedEventArgs>? _readRequestSub;
  StreamSubscription<GATTCharacteristicWriteRequestedEventArgs>?
  _writeRequestSub;

  /// Central オブジェクトのキャッシュ（Notify 送信先）
  final _centrals = <String, Central>{};
  final _connectedCountController = StreamController<int>.broadcast();
  final _writeRequestController = StreamController<List<int>>.broadcast();

  /// addService 時に登録した Characteristic（Notify 送信に必要）
  GATTCharacteristic? _registeredCharacteristic;

  // --- アダプタ状態 ---

  @override
  BleAdapterState get adapterState =>
      _mapAdapterState(_peripheralManager.state);

  @override
  Stream<BleAdapterState> get adapterStateStream =>
      _peripheralManager.stateChanged.map((e) => _mapAdapterState(e.state));

  @override
  Future<bool> authorize() async {
    if (Platform.isIOS || Platform.isMacOS) return true;

    final bleAuthorized = await _peripheralManager.authorize();
    if (!bleAuthorized) return false;

    final advertiseStatus = await Permission.bluetoothAdvertise.request();
    if (!advertiseStatus.isGranted) return false;

    final locationStatus = await Permission.locationWhenInUse.request();
    return locationStatus.isGranted;
  }

  // --- アドバタイズ ---

  @override
  Future<void> startAdvertising({
    required String serviceUuid,
    required String characteristicUuid,
    String? deviceName,
    List<domain.BleCharacteristicProperty>? properties,
  }) async {
    // Android: bluetooth_low_energy v6 において、PeripheralManager の
    // removeAllServices / addService / startAdvertising が
    // ネイティブ側で成功しても Dart の Future が解決しないバグがある。
    // 各操作にタイムアウトを設けて回避する。
    // ref: https://github.com/nickmeinhold/bluetooth_low_energy/issues
    const workaround = Duration(seconds: 3);

    try {
      await _peripheralManager.removeAllServices().timeout(workaround);
    } on TimeoutException {
      log('removeAllServices timed out (Android workaround)');
    }

    final bleProperties =
        (properties ??
                [
                  domain.BleCharacteristicProperty.read,
                  domain.BleCharacteristicProperty.write,
                ])
            .map(_mapToBleProperty)
            .toList();

    final characteristic = GATTCharacteristic.mutable(
      uuid: UUID.fromString(characteristicUuid),
      properties: bleProperties,
      permissions: [
        GATTCharacteristicPermission.read,
        GATTCharacteristicPermission.write,
      ],
      descriptors: [],
    );
    _registeredCharacteristic = characteristic;

    final service = GATTService(
      uuid: UUID.fromString(serviceUuid),
      isPrimary: true,
      includedServices: [],
      characteristics: [characteristic],
    );

    try {
      await _peripheralManager.addService(service).timeout(workaround);
    } on TimeoutException {
      log('addService timed out (Android workaround)');
    }

    try {
      await _peripheralManager
          .startAdvertising(
            Advertisement(
              name: deviceName,
              serviceUUIDs: [UUID.fromString(serviceUuid)],
            ),
          )
          .timeout(workaround);
    } on TimeoutException {
      log('startAdvertising timed out (Android workaround)');
    }
  }

  @override
  Future<void> stopAdvertising() async {
    await _readRequestSub?.cancel();
    _readRequestSub = null;
    await _writeRequestSub?.cancel();
    _writeRequestSub = null;
    _registeredCharacteristic = null;
    await _peripheralManager.stopAdvertising();
    await _peripheralManager.removeAllServices();
    _centrals.clear();
    _connectedCountController.add(0);
  }

  // --- リクエストハンドリング ---

  @override
  Future<void> startHandlingRequests({
    required String responseValue,
  }) async {
    await _readRequestSub?.cancel();
    await _writeRequestSub?.cancel();
    final valueBytes = Uint8List.fromList(utf8.encode(responseValue));

    // Read リクエスト応答
    _readRequestSub = _peripheralManager.characteristicReadRequested.listen((
      e,
    ) async {
      _centrals[e.central.uuid.toString()] = e.central;
      _connectedCountController.add(_centrals.length);
      await _peripheralManager.respondReadRequestWithValue(
        e.request,
        value: valueBytes,
      );
    });

    // Write リクエスト応答
    _writeRequestSub = _peripheralManager.characteristicWriteRequested.listen((
      e,
    ) async {
      _centrals[e.central.uuid.toString()] = e.central;
      _connectedCountController.add(_centrals.length);
      _writeRequestController.add(e.request.value.toList());
      await _peripheralManager.respondWriteRequest(e.request);
    });

    // Central の接続状態を監視
    // iOS/macOS: PeripheralManager の connectionStateChanged が
    // サポートされていないため、Read/Write リクエストの到着で
    // Central の存在を間接的に検知している
    if (!Platform.isIOS && !Platform.isMacOS) {
      _peripheralManager.connectionStateChanged.listen((e) {
        final id = e.central.uuid.toString();
        if (e.state == ble.ConnectionState.connected) {
          _centrals[id] = e.central;
        } else {
          _centrals.remove(id);
        }
        _connectedCountController.add(_centrals.length);
      });
    }
  }

  // --- Write リクエストストリーム ---

  @override
  Stream<List<int>> get writeRequestStream => _writeRequestController.stream;

  // --- Notify ---

  @override
  Future<void> notifyValue({required List<int> value}) async {
    final characteristic = _registeredCharacteristic;
    if (characteristic == null) return;

    final bytes = Uint8List.fromList(value);
    for (final entry in _centrals.entries) {
      try {
        await _peripheralManager.notifyCharacteristic(
          entry.value,
          characteristic,
          value: bytes,
        );
      } on Exception catch (e) {
        log('Notify failed for ${entry.key}: $e');
        // 送信失敗した Central は削除
        _centrals.remove(entry.key);
        _connectedCountController.add(_centrals.length);
      }
    }
  }

  // --- 接続数ストリーム ---

  @override
  Stream<int> get connectedCentralCountStream =>
      _connectedCountController.stream;

  // --- マッピング ---

  BleAdapterState _mapAdapterState(BluetoothLowEnergyState state) {
    return switch (state) {
      BluetoothLowEnergyState.unknown => BleAdapterState.unknown,
      BluetoothLowEnergyState.unsupported => BleAdapterState.unsupported,
      BluetoothLowEnergyState.unauthorized => BleAdapterState.unauthorized,
      BluetoothLowEnergyState.poweredOff => BleAdapterState.poweredOff,
      BluetoothLowEnergyState.poweredOn => BleAdapterState.poweredOn,
    };
  }

  GATTCharacteristicProperty _mapToBleProperty(
    domain.BleCharacteristicProperty property,
  ) {
    return switch (property) {
      domain.BleCharacteristicProperty.read => GATTCharacteristicProperty.read,
      domain.BleCharacteristicProperty.write =>
        GATTCharacteristicProperty.write,
      domain.BleCharacteristicProperty.writeWithoutResponse =>
        GATTCharacteristicProperty.writeWithoutResponse,
      domain.BleCharacteristicProperty.notify =>
        GATTCharacteristicProperty.notify,
      domain.BleCharacteristicProperty.indicate =>
        GATTCharacteristicProperty.indicate,
    };
  }
}
