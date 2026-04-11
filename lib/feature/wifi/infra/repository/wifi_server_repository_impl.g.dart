// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_server_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wifiServerRepository)
final wifiServerRepositoryProvider = WifiServerRepositoryProvider._();

final class WifiServerRepositoryProvider
    extends
        $FunctionalProvider<
          WifiServerRepository,
          WifiServerRepository,
          WifiServerRepository
        >
    with $Provider<WifiServerRepository> {
  WifiServerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiServerRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiServerRepositoryHash();

  @$internal
  @override
  $ProviderElement<WifiServerRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WifiServerRepository create(Ref ref) {
    return wifiServerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiServerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiServerRepository>(value),
    );
  }
}

String _$wifiServerRepositoryHash() =>
    r'156e92f36a807e806f69f4afe201a79a45532ac9';
