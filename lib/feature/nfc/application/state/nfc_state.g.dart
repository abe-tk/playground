// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nfc_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NfcNotifier)
final nfcProvider = NfcNotifierProvider._();

final class NfcNotifierProvider
    extends $NotifierProvider<NfcNotifier, NfcState> {
  NfcNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nfcProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nfcNotifierHash();

  @$internal
  @override
  NfcNotifier create() => NfcNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NfcState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NfcState>(value),
    );
  }
}

String _$nfcNotifierHash() => r'316b84e996bffc109e2414404c26052ff89f053b';

abstract class _$NfcNotifier extends $Notifier<NfcState> {
  NfcState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NfcState, NfcState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NfcState, NfcState>,
              NfcState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
