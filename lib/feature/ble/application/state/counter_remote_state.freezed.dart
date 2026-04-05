// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_remote_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CounterRemoteState {

 BleConnectionState get connectionState; bool get isLoading; int? get currentValue; String? get error;
/// Create a copy of CounterRemoteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterRemoteStateCopyWith<CounterRemoteState> get copyWith => _$CounterRemoteStateCopyWithImpl<CounterRemoteState>(this as CounterRemoteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterRemoteState&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,connectionState,isLoading,currentValue,error);

@override
String toString() {
  return 'CounterRemoteState(connectionState: $connectionState, isLoading: $isLoading, currentValue: $currentValue, error: $error)';
}


}

/// @nodoc
abstract mixin class $CounterRemoteStateCopyWith<$Res>  {
  factory $CounterRemoteStateCopyWith(CounterRemoteState value, $Res Function(CounterRemoteState) _then) = _$CounterRemoteStateCopyWithImpl;
@useResult
$Res call({
 BleConnectionState connectionState, bool isLoading, int? currentValue, String? error
});




}
/// @nodoc
class _$CounterRemoteStateCopyWithImpl<$Res>
    implements $CounterRemoteStateCopyWith<$Res> {
  _$CounterRemoteStateCopyWithImpl(this._self, this._then);

  final CounterRemoteState _self;
  final $Res Function(CounterRemoteState) _then;

/// Create a copy of CounterRemoteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? connectionState = null,Object? isLoading = null,Object? currentValue = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as BleConnectionState,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterRemoteState].
extension CounterRemoteStatePatterns on CounterRemoteState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterRemoteState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterRemoteState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterRemoteState value)  $default,){
final _that = this;
switch (_that) {
case _CounterRemoteState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterRemoteState value)?  $default,){
final _that = this;
switch (_that) {
case _CounterRemoteState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BleConnectionState connectionState,  bool isLoading,  int? currentValue,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterRemoteState() when $default != null:
return $default(_that.connectionState,_that.isLoading,_that.currentValue,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BleConnectionState connectionState,  bool isLoading,  int? currentValue,  String? error)  $default,) {final _that = this;
switch (_that) {
case _CounterRemoteState():
return $default(_that.connectionState,_that.isLoading,_that.currentValue,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BleConnectionState connectionState,  bool isLoading,  int? currentValue,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _CounterRemoteState() when $default != null:
return $default(_that.connectionState,_that.isLoading,_that.currentValue,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CounterRemoteState implements CounterRemoteState {
  const _CounterRemoteState({this.connectionState = BleConnectionState.disconnected, this.isLoading = false, this.currentValue, this.error});
  

@override@JsonKey() final  BleConnectionState connectionState;
@override@JsonKey() final  bool isLoading;
@override final  int? currentValue;
@override final  String? error;

/// Create a copy of CounterRemoteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterRemoteStateCopyWith<_CounterRemoteState> get copyWith => __$CounterRemoteStateCopyWithImpl<_CounterRemoteState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterRemoteState&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.currentValue, currentValue) || other.currentValue == currentValue)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,connectionState,isLoading,currentValue,error);

@override
String toString() {
  return 'CounterRemoteState(connectionState: $connectionState, isLoading: $isLoading, currentValue: $currentValue, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CounterRemoteStateCopyWith<$Res> implements $CounterRemoteStateCopyWith<$Res> {
  factory _$CounterRemoteStateCopyWith(_CounterRemoteState value, $Res Function(_CounterRemoteState) _then) = __$CounterRemoteStateCopyWithImpl;
@override @useResult
$Res call({
 BleConnectionState connectionState, bool isLoading, int? currentValue, String? error
});




}
/// @nodoc
class __$CounterRemoteStateCopyWithImpl<$Res>
    implements _$CounterRemoteStateCopyWith<$Res> {
  __$CounterRemoteStateCopyWithImpl(this._self, this._then);

  final _CounterRemoteState _self;
  final $Res Function(_CounterRemoteState) _then;

/// Create a copy of CounterRemoteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? connectionState = null,Object? isLoading = null,Object? currentValue = freezed,Object? error = freezed,}) {
  return _then(_CounterRemoteState(
connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as BleConnectionState,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,currentValue: freezed == currentValue ? _self.currentValue : currentValue // ignore: cast_nullable_to_non_nullable
as int?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
