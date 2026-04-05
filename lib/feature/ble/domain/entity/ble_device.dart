import 'package:freezed_annotation/freezed_annotation.dart';

part 'ble_device.freezed.dart';

@freezed
abstract class BleDevice with _$BleDevice {
  const factory BleDevice({
    required String id,
    required int rssi,
    String? name,
    @Default([]) List<String> serviceUuids,
  }) = _BleDevice;
}
