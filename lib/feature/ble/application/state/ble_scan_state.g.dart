// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_scan_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BleScanNotifier)
final bleScanProvider = BleScanNotifierProvider._();

final class BleScanNotifierProvider
    extends $NotifierProvider<BleScanNotifier, BleScanState> {
  BleScanNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bleScanProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bleScanNotifierHash();

  @$internal
  @override
  BleScanNotifier create() => BleScanNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BleScanState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BleScanState>(value),
    );
  }
}

String _$bleScanNotifierHash() => r'5168e015fdc63ff3421ae1384cbb51c75c26cf75';

abstract class _$BleScanNotifier extends $Notifier<BleScanState> {
  BleScanState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BleScanState, BleScanState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BleScanState, BleScanState>,
              BleScanState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
