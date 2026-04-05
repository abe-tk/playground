import 'package:mocktail/mocktail.dart';
import 'package:playground/feature/ble/domain/repository/ble_peripheral_repository.dart';
import 'package:playground/feature/ble/domain/repository/ble_repository.dart';

class MockBleRepository extends Mock implements BleRepository {}

class MockBlePeripheralRepository extends Mock
    implements BlePeripheralRepository {}
