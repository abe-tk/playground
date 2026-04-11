// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_server_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(WifiServerNotifier)
final wifiServerProvider = WifiServerNotifierProvider._();

final class WifiServerNotifierProvider
    extends $NotifierProvider<WifiServerNotifier, WifiServerState> {
  WifiServerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiServerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiServerNotifierHash();

  @$internal
  @override
  WifiServerNotifier create() => WifiServerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiServerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiServerState>(value),
    );
  }
}

String _$wifiServerNotifierHash() =>
    r'a061fae4e6ab997513d18cdfda6da13cbb8f8bfc';

abstract class _$WifiServerNotifier extends $Notifier<WifiServerState> {
  WifiServerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<WifiServerState, WifiServerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<WifiServerState, WifiServerState>,
              WifiServerState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
