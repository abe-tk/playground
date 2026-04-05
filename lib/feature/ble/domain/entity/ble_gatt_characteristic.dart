import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:playground/feature/ble/domain/entity/ble_characteristic_property.dart';

part 'ble_gatt_characteristic.freezed.dart';

@freezed
abstract class BleGattCharacteristic with _$BleGattCharacteristic {
  const factory BleGattCharacteristic({
    required String uuid,
    @Default([]) List<BleCharacteristicProperty> properties,
  }) = _BleGattCharacteristic;
}
