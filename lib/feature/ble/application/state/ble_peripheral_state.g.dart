// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_peripheral_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BlePeripheralNotifier)
final blePeripheralProvider = BlePeripheralNotifierProvider._();

final class BlePeripheralNotifierProvider
    extends $NotifierProvider<BlePeripheralNotifier, BlePeripheralState> {
  BlePeripheralNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'blePeripheralProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$blePeripheralNotifierHash();

  @$internal
  @override
  BlePeripheralNotifier create() => BlePeripheralNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BlePeripheralState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BlePeripheralState>(value),
    );
  }
}

String _$blePeripheralNotifierHash() =>
    r'1aad939d1a3d37b1362e3f26c631f7dd42cfdb36';

abstract class _$BlePeripheralNotifier extends $Notifier<BlePeripheralState> {
  BlePeripheralState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BlePeripheralState, BlePeripheralState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BlePeripheralState, BlePeripheralState>,
              BlePeripheralState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
