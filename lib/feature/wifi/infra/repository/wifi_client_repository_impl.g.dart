// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wifi_client_repository_impl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(wifiClientRepository)
final wifiClientRepositoryProvider = WifiClientRepositoryProvider._();

final class WifiClientRepositoryProvider
    extends
        $FunctionalProvider<
          WifiClientRepository,
          WifiClientRepository,
          WifiClientRepository
        >
    with $Provider<WifiClientRepository> {
  WifiClientRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'wifiClientRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$wifiClientRepositoryHash();

  @$internal
  @override
  $ProviderElement<WifiClientRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WifiClientRepository create(Ref ref) {
    return wifiClientRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WifiClientRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WifiClientRepository>(value),
    );
  }
}

String _$wifiClientRepositoryHash() =>
    r'a12438558c730e750f1900148b14be88e8400d66';
