// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_display_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CounterDisplayNotifier)
final counterDisplayProvider = CounterDisplayNotifierProvider._();

final class CounterDisplayNotifierProvider
    extends $NotifierProvider<CounterDisplayNotifier, CounterDisplayState> {
  CounterDisplayNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'counterDisplayProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$counterDisplayNotifierHash();

  @$internal
  @override
  CounterDisplayNotifier create() => CounterDisplayNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CounterDisplayState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CounterDisplayState>(value),
    );
  }
}

String _$counterDisplayNotifierHash() =>
    r'8eb29ec6e59d0cca4e7df7900590458c441a67cb';

abstract class _$CounterDisplayNotifier extends $Notifier<CounterDisplayState> {
  CounterDisplayState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CounterDisplayState, CounterDisplayState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CounterDisplayState, CounterDisplayState>,
              CounterDisplayState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
