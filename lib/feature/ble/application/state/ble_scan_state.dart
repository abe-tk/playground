import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playground/feature/ble/domain/entity/ble_adapter_state.dart';
import 'package:playground/feature/ble/domain/entity/ble_device.dart';
import 'package:playground/feature/ble/infra/repository/ble_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ble_scan_state.freezed.dart';
part 'ble_scan_state.g.dart';

@freezed
abstract class BleScanState with _$BleScanState {
  const factory BleScanState({
    @Default([]) List<BleDevice> devices,
    @Default(false) bool isScanning,
    @Default(BleAdapterState.unknown) BleAdapterState adapterState,
  }) = _BleScanState;
}

@riverpod
class BleScanNotifier extends _$BleScanNotifier {
  StreamSubscription<BleAdapterState>? _adapterStateSub;
  StreamSubscription<BleDevice>? _discoverySub;

  @override
  BleScanState build() {
    final repository = ref.watch(bleRepositoryProvider);

    unawaited(_adapterStateSub?.cancel());
    _adapterStateSub = repository.adapterStateStream.listen(
      (adapterState) {
        state = state.copyWith(adapterState: adapterState);
      },
      onError: (Object e) {
        state = state.copyWith(
          adapterState: BleAdapterState.unknown,
        );
      },
    );

    ref.onDispose(() {
      unawaited(_adapterStateSub?.cancel());
      unawaited(_discoverySub?.cancel());
    });

    return BleScanState(adapterState: repository.adapterState);
  }

  Future<void> authorize() async {
    final repository = ref.read(bleRepositoryProvider);
    await repository.authorize();
  }

  Future<void> startScan() async {
    final repository = ref.read(bleRepositoryProvider);

    // ランタイムパーミッションを要求（Android では必須）
    final authorized = await repository.authorize();
    if (!authorized) return;

    state = state.copyWith(devices: [], isScanning: true);

    unawaited(_discoverySub?.cancel());
    _discoverySub = repository.discoveredDevices.listen((device) {
      final devices = [...state.devices];
      final index = devices.indexWhere((d) => d.id == device.id);
      if (index >= 0) {
        // 名前が取れていた場合は保持する（パケットにより有無が変わるため）
        final existing = devices[index];
        devices[index] = device.copyWith(
          name: device.name ?? existing.name,
        );
      } else {
        devices.add(device);
      }
      state = state.copyWith(devices: devices);
    });

    await repository.startScan();
  }

  Future<void> stopScan() async {
    final repository = ref.read(bleRepositoryProvider);
    await repository.stopScan();
    unawaited(_discoverySub?.cancel());
    state = state.copyWith(isScanning: false);
  }
}
