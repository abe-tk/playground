import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playground/feature/ble/domain/entity/ble_gatt_characteristic.dart';

part 'ble_gatt_service.freezed.dart';

@freezed
abstract class BleGattService with _$BleGattService {
  const factory BleGattService({
    required String uuid,
    required bool isPrimary,
    @Default([]) List<BleGattCharacteristic> characteristics,
  }) = _BleGattService;
}
