// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bleRepository)
final bleRepositoryProvider = BleRepositoryProvider._();

final class BleRepositoryProvider
    extends $FunctionalProvider<BleRepository, BleRepository, BleRepository>
    with $Provider<BleRepository> {
  BleRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bleRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bleRepositoryHash();

  @$internal
  @override
  $ProviderElement<BleRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BleRepository create(Ref ref) {
    return bleRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BleRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BleRepository>(value),
    );
  }
}

String _$bleRepositoryHash() => r'fd332dba569c697ee6a2250bb67e1f689ae6f5a9';
