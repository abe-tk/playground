// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_peripheral_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(blePeripheralRepository)
final blePeripheralRepositoryProvider = BlePeripheralRepositoryProvider._();

final class BlePeripheralRepositoryProvider
    extends
        $FunctionalProvider<
          BlePeripheralRepository,
          BlePeripheralRepository,
          BlePeripheralRepository
        >
    with $Provider<BlePeripheralRepository> {
  BlePeripheralRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'blePeripheralRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$blePeripheralRepositoryHash();

  @$internal
  @override
  $ProviderElement<BlePeripheralRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BlePeripheralRepository create(Ref ref) {
    return blePeripheralRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BlePeripheralRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BlePeripheralRepository>(value),
    );
  }
}

String _$blePeripheralRepositoryHash() =>
    r'0326628d17fa1741daaa65454550bdc768fbf3b3';
