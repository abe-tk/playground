// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_device_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BleDeviceState {

 BleConnectionState get connectionState; List<BleGattService> get services; bool get isLoading; String? get readValue; String? get error;
/// Create a copy of BleDeviceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BleDeviceStateCopyWith<BleDeviceState> get copyWith => _$BleDeviceStateCopyWithImpl<BleDeviceState>(this as BleDeviceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleDeviceState&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.readValue, readValue) || other.readValue == readValue)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,connectionState,const DeepCollectionEquality().hash(services),isLoading,readValue,error);

@override
String toString() {
  return 'BleDeviceState(connectionState: $connectionState, services: $services, isLoading: $isLoading, readValue: $readValue, error: $error)';
}


}

/// @nodoc
abstract mixin class $BleDeviceStateCopyWith<$Res>  {
  factory $BleDeviceStateCopyWith(BleDeviceState value, $Res Function(BleDeviceState) _then) = _$BleDeviceStateCopyWithImpl;
@useResult
$Res call({
 BleConnectionState connectionState, List<BleGattService> services, bool isLoading, String? readValue, String? error
});




}
/// @nodoc
class _$BleDeviceStateCopyWithImpl<$Res>
    implements $BleDeviceStateCopyWith<$Res> {
  _$BleDeviceStateCopyWithImpl(this._self, this._then);

  final BleDeviceState _self;
  final $Res Function(BleDeviceState) _then;

/// Create a copy of BleDeviceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionState = null,Object? services = null,Object? isLoading = null,Object? readValue = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as BleConnectionState,services: null == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<BleGattService>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,readValue: freezed == readValue ? _self.readValue : readValue // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BleDeviceState].
extension BleDeviceStatePatterns on BleDeviceState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BleDeviceState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BleDeviceState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BleDeviceState value)  $default,){
final _that = this;
switch (_that) {
case _BleDeviceState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BleDeviceState value)?  $default,){
final _that = this;
switch (_that) {
case _BleDeviceState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BleConnectionState connectionState,  List<BleGattService> services,  bool isLoading,  String? readValue,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BleDeviceState() when $default != null:
return $default(_that.connectionState,_that.services,_that.isLoading,_that.readValue,_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BleConnectionState connectionState,  List<BleGattService> services,  bool isLoading,  String? readValue,  String? error)  $default,) {final _that = this;
switch (_that) {
case _BleDeviceState():
return $default(_that.connectionState,_that.services,_that.isLoading,_that.readValue,_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BleConnectionState connectionState,  List<BleGattService> services,  bool isLoading,  String? readValue,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _BleDeviceState() when $default != null:
return $default(_that.connectionState,_that.services,_that.isLoading,_that.readValue,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _BleDeviceState implements BleDeviceState {
  const _BleDeviceState({this.connectionState = BleConnectionState.disconnected, final  List<BleGattService> services = const [], this.isLoading = false, this.readValue, this.error}): _services = services;
  

@override@JsonKey() final  BleConnectionState connectionState;
 final  List<BleGattService> _services;
@override@JsonKey() List<BleGattService> get services {
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_services);
}

@override@JsonKey() final  bool isLoading;
@override final  String? readValue;
@override final  String? error;

/// Create a copy of BleDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BleDeviceStateCopyWith<_BleDeviceState> get copyWith => __$BleDeviceStateCopyWithImpl<_BleDeviceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BleDeviceState&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.readValue, readValue) || other.readValue == readValue)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,connectionState,const DeepCollectionEquality().hash(_services),isLoading,readValue,error);

@override
String toString() {
  return 'BleDeviceState(connectionState: $connectionState, services: $services, isLoading: $isLoading, readValue: $readValue, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BleDeviceStateCopyWith<$Res> implements $BleDeviceStateCopyWith<$Res> {
  factory _$BleDeviceStateCopyWith(_BleDeviceState value, $Res Function(_BleDeviceState) _then) = __$BleDeviceStateCopyWithImpl;
@override @useResult
$Res call({
 BleConnectionState connectionState, List<BleGattService> services, bool isLoading, String? readValue, String? error
});




}
/// @nodoc
class __$BleDeviceStateCopyWithImpl<$Res>
    implements _$BleDeviceStateCopyWith<$Res> {
  __$BleDeviceStateCopyWithImpl(this._self, this._then);

  final _BleDeviceState _self;
  final $Res Function(_BleDeviceState) _then;

/// Create a copy of BleDeviceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionState = null,Object? services = null,Object? isLoading = null,Object? readValue = freezed,Object? error = freezed,}) {
  return _then(_BleDeviceState(
connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as BleConnectionState,services: null == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<BleGattService>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,readValue: freezed == readValue ? _self.readValue : readValue // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
