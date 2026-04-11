// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_client_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WifiClientNotifier)
final wifiClientProvider = WifiClientNotifierProvider._();

final class WifiClientNotifierProvider
    extends $NotifierProvider<WifiClientNotifier, WifiClientState> {
  WifiClientNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiClientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiClientNotifierHash();

  @$internal
  @override
  WifiClientNotifier create() => WifiClientNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiClientState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiClientState>(value),
    );
  }
}

String _$wifiClientNotifierHash() =>
    r'6bf8eb5d819f6edaf7d4ea1f4781ebc5ea7e5d9c';

abstract class _$WifiClientNotifier extends $Notifier<WifiClientState> {
  WifiClientState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WifiClientState, WifiClientState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WifiClientState, WifiClientState>,
              WifiClientState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
