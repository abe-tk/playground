import 'package:freezed_annotation/freezed_annotation.dart';

part 'wifi_device.freezed.dart';

/// mDNS で発見したサービス
@freezed
abstract class WifiDevice with _$WifiDevice {
  const factory WifiDevice({
    required String name,
    required String host,
    required int port,
  }) = _WifiDevice;
}
