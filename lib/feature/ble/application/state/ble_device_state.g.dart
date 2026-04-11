// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ble_device_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BleDeviceNotifier)
final bleDeviceProvider = BleDeviceNotifierFamily._();

final class BleDeviceNotifierProvider
    extends $NotifierProvider<BleDeviceNotifier, BleDeviceState> {
  BleDeviceNotifierProvider._({
    required BleDeviceNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'bleDeviceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$bleDeviceNotifierHash();

  @override
  String toString() {
    return r'bleDeviceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  BleDeviceNotifier create() => BleDeviceNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BleDeviceState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BleDeviceState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is BleDeviceNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$bleDeviceNotifierHash() => r'9a17fe8524a398e0b74f67d1206914d2e6fc53b4';

final class BleDeviceNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          BleDeviceNotifier,
          BleDeviceState,
          BleDeviceState,
          BleDeviceState,
          String
        > {
  BleDeviceNotifierFamily._()
    : super(
        retry: null,
        name: r'bleDeviceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  BleDeviceNotifierProvider call(String deviceId) =>
      BleDeviceNotifierProvider._(argument: deviceId, from: this);

  @override
  String toString() => r'bleDeviceProvider';
}

abstract class _$BleDeviceNotifier extends $Notifier<BleDeviceState> {
  late final _$args = ref.$arg as String;
  String get deviceId => _$args;

  BleDeviceState build(String deviceId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BleDeviceState, BleDeviceState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BleDeviceState, BleDeviceState>,
              BleDeviceState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
