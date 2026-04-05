// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_display_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CounterDisplayState {

 BleAdapterState get adapterState; bool get isAdvertising; bool get isLoading; int get counter; int get connectedCentralCount; String? get error;
/// Create a copy of CounterDisplayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterDisplayStateCopyWith<CounterDisplayState> get copyWith => _$CounterDisplayStateCopyWithImpl<CounterDisplayState>(this as CounterDisplayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterDisplayState&&(identical(other.adapterState, adapterState) || other.adapterState == adapterState)&&(identical(other.isAdvertising, isAdvertising) || other.isAdvertising == isAdvertising)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.counter, counter) || other.counter == counter)&&(identical(other.connectedCentralCount, connectedCentralCount) || other.connectedCentralCount == connectedCentralCount)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,adapterState,isAdvertising,isLoading,counter,connectedCentralCount,error);

@override
String toString() {
  return 'CounterDisplayState(adapterState: $adapterState, isAdvertising: $isAdvertising, isLoading: $isLoading, counter: $counter, connectedCentralCount: $connectedCentralCount, error: $error)';
}


}

/// @nodoc
abstract mixin class $CounterDisplayStateCopyWith<$Res>  {
  factory $CounterDisplayStateCopyWith(CounterDisplayState value, $Res Function(CounterDisplayState) _then) = _$CounterDisplayStateCopyWithImpl;
@useResult
$Res call({
 BleAdapterState adapterState, bool isAdvertising, bool isLoading, int counter, int connectedCentralCount, String? error
});




}
/// @nodoc
class _$CounterDisplayStateCopyWithImpl<$Res>
    implements $CounterDisplayStateCopyWith<$Res> {
  _$CounterDisplayStateCopyWithImpl(this._self, this._then);

  final CounterDisplayState _self;
  final $Res Function(CounterDisplayState) _then;

/// Create a copy of CounterDisplayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? adapterState = null,Object? isAdvertising = null,Object? isLoading = null,Object? counter = null,Object? connectedCentralCount = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
adapterState: null == adapterState ? _self.adapterState : adapterState // ignore: cast_nullable_to_non_nullable
as BleAdapterState,isAdvertising: null == isAdvertising ? _self.isAdvertising : isAdvertising // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,counter: null == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as int,connectedCentralCount: null == connectedCentralCount ? _self.connectedCentralCount : connectedCentralCount // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterDisplayState].
extension CounterDisplayStatePatterns on CounterDisplayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CounterDisplayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CounterDisplayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CounterDisplayState value)  $default,){
final _that = this;
switch (_that) {
case _CounterDisplayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CounterDisplayState value)?  $default,){
final _that = this;
switch (_that) {
case _CounterDisplayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BleAdapterState adapterState,  bool isAdvertising,  bool isLoading,  int counter,  int connectedCentralCount,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CounterDisplayState() when $default != null:
return $default(_that.adapterState,_that.isAdvertising,_that.isLoading,_that.counter,_that.connectedCentralCount,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BleAdapterState adapterState,  bool isAdvertising,  bool isLoading,  int counter,  int connectedCentralCount,  String? error)  $default,) {final _that = this;
switch (_that) {
case _CounterDisplayState():
return $default(_that.adapterState,_that.isAdvertising,_that.isLoading,_that.counter,_that.connectedCentralCount,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BleAdapterState adapterState,  bool isAdvertising,  bool isLoading,  int counter,  int connectedCentralCount,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _CounterDisplayState() when $default != null:
return $default(_that.adapterState,_that.isAdvertising,_that.isLoading,_that.counter,_that.connectedCentralCount,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _CounterDisplayState implements CounterDisplayState {
  const _CounterDisplayState({this.adapterState = BleAdapterState.unknown, this.isAdvertising = false, this.isLoading = false, this.counter = 0, this.connectedCentralCount = 0, this.error});
  

@override@JsonKey() final  BleAdapterState adapterState;
@override@JsonKey() final  bool isAdvertising;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int counter;
@override@JsonKey() final  int connectedCentralCount;
@override final  String? error;

/// Create a copy of CounterDisplayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterDisplayStateCopyWith<_CounterDisplayState> get copyWith => __$CounterDisplayStateCopyWithImpl<_CounterDisplayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CounterDisplayState&&(identical(other.adapterState, adapterState) || other.adapterState == adapterState)&&(identical(other.isAdvertising, isAdvertising) || other.isAdvertising == isAdvertising)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.counter, counter) || other.counter == counter)&&(identical(other.connectedCentralCount, connectedCentralCount) || other.connectedCentralCount == connectedCentralCount)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,adapterState,isAdvertising,isLoading,counter,connectedCentralCount,error);

@override
String toString() {
  return 'CounterDisplayState(adapterState: $adapterState, isAdvertising: $isAdvertising, isLoading: $isLoading, counter: $counter, connectedCentralCount: $connectedCentralCount, error: $error)';
}


}

/// @nodoc
abstract mixin class _$CounterDisplayStateCopyWith<$Res> implements $CounterDisplayStateCopyWith<$Res> {
  factory _$CounterDisplayStateCopyWith(_CounterDisplayState value, $Res Function(_CounterDisplayState) _then) = __$CounterDisplayStateCopyWithImpl;
@override @useResult
$Res call({
 BleAdapterState adapterState, bool isAdvertising, bool isLoading, int counter, int connectedCentralCount, String? error
});




}
/// @nodoc
class __$CounterDisplayStateCopyWithImpl<$Res>
    implements _$CounterDisplayStateCopyWith<$Res> {
  __$CounterDisplayStateCopyWithImpl(this._self, this._then);

  final _CounterDisplayState _self;
  final $Res Function(_CounterDisplayState) _then;

/// Create a copy of CounterDisplayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? adapterState = null,Object? isAdvertising = null,Object? isLoading = null,Object? counter = null,Object? connectedCentralCount = null,Object? error = freezed,}) {
  return _then(_CounterDisplayState(
adapterState: null == adapterState ? _self.adapterState : adapterState // ignore: cast_nullable_to_non_nullable
as BleAdapterState,isAdvertising: null == isAdvertising ? _self.isAdvertising : isAdvertising // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,counter: null == counter ? _self.counter : counter // ignore: cast_nullable_to_non_nullable
as int,connectedCentralCount: null == connectedCentralCount ? _self.connectedCentralCount : connectedCentralCount // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
