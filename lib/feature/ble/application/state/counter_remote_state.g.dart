// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_remote_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CounterRemoteNotifier)
final counterRemoteProvider = CounterRemoteNotifierFamily._();

final class CounterRemoteNotifierProvider
    extends $NotifierProvider<CounterRemoteNotifier, CounterRemoteState> {
  CounterRemoteNotifierProvider._({
    required CounterRemoteNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'counterRemoteProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$counterRemoteNotifierHash();

  @override
  String toString() {
    return r'counterRemoteProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CounterRemoteNotifier create() => CounterRemoteNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CounterRemoteState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CounterRemoteState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CounterRemoteNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$counterRemoteNotifierHash() =>
    r'8554459664ab114c6b6ebf2d29508c217d4a40ee';

final class CounterRemoteNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CounterRemoteNotifier,
          CounterRemoteState,
          CounterRemoteState,
          CounterRemoteState,
          String
        > {
  CounterRemoteNotifierFamily._()
    : super(
        retry: null,
        name: r'counterRemoteProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CounterRemoteNotifierProvider call(String deviceId) =>
      CounterRemoteNotifierProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'counterRemoteProvider';
}

abstract class _$CounterRemoteNotifier extends $Notifier<CounterRemoteState> {
  late final _$args = ref.$arg as String;
  String get deviceId => _$args;

  CounterRemoteState build(String deviceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CounterRemoteState, CounterRemoteState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CounterRemoteState, CounterRemoteState>,
              CounterRemoteState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
