// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_client_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WifiClientState {

 List<WifiDevice> get devices; bool get isDiscovering; WifiConnectionState get connectionState; bool get isLoading; List<ChatMessage> get messages; String? get error;
/// Create a copy of WifiClientState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiClientStateCopyWith<WifiClientState> get copyWith => _$WifiClientStateCopyWithImpl<WifiClientState>(this as WifiClientState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiClientState&&const DeepCollectionEquality().equals(other.devices, devices)&&(identical(other.isDiscovering, isDiscovering) || other.isDiscovering == isDiscovering)&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(devices),isDiscovering,connectionState,isLoading,const DeepCollectionEquality().hash(messages),error);

@override
String toString() {
  return 'WifiClientState(devices: $devices, isDiscovering: $isDiscovering, connectionState: $connectionState, isLoading: $isLoading, messages: $messages, error: $error)';
}


}

/// @nodoc
abstract mixin class $WifiClientStateCopyWith<$Res>  {
  factory $WifiClientStateCopyWith(WifiClientState value, $Res Function(WifiClientState) _then) = _$WifiClientStateCopyWithImpl;
@useResult
$Res call({
 List<WifiDevice> devices, bool isDiscovering, WifiConnectionState connectionState, bool isLoading, List<ChatMessage> messages, String? error
});




}
/// @nodoc
class _$WifiClientStateCopyWithImpl<$Res>
    implements $WifiClientStateCopyWith<$Res> {
  _$WifiClientStateCopyWithImpl(this._self, this._then);

  final WifiClientState _self;
  final $Res Function(WifiClientState) _then;

/// Create a copy of WifiClientState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? devices = null,Object? isDiscovering = null,Object? connectionState = null,Object? isLoading = null,Object? messages = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as List<WifiDevice>,isDiscovering: null == isDiscovering ? _self.isDiscovering : isDiscovering // ignore: cast_nullable_to_non_nullable
as bool,connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as WifiConnectionState,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WifiClientState].
extension WifiClientStatePatterns on WifiClientState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiClientState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiClientState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiClientState value)  $default,){
final _that = this;
switch (_that) {
case _WifiClientState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiClientState value)?  $default,){
final _that = this;
switch (_that) {
case _WifiClientState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WifiDevice> devices,  bool isDiscovering,  WifiConnectionState connectionState,  bool isLoading,  List<ChatMessage> messages,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiClientState() when $default != null:
return $default(_that.devices,_that.isDiscovering,_that.connectionState,_that.isLoading,_that.messages,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WifiDevice> devices,  bool isDiscovering,  WifiConnectionState connectionState,  bool isLoading,  List<ChatMessage> messages,  String? error)  $default,) {final _that = this;
switch (_that) {
case _WifiClientState():
return $default(_that.devices,_that.isDiscovering,_that.connectionState,_that.isLoading,_that.messages,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WifiDevice> devices,  bool isDiscovering,  WifiConnectionState connectionState,  bool isLoading,  List<ChatMessage> messages,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _WifiClientState() when $default != null:
return $default(_that.devices,_that.isDiscovering,_that.connectionState,_that.isLoading,_that.messages,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WifiClientState implements WifiClientState {
  const _WifiClientState({final  List<WifiDevice> devices = const [], this.isDiscovering = false, this.connectionState = WifiConnectionState.disconnected, this.isLoading = false, final  List<ChatMessage> messages = const [], this.error}): _devices = devices,_messages = messages;
  

 final  List<WifiDevice> _devices;
@override@JsonKey() List<WifiDevice> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}

@override@JsonKey() final  bool isDiscovering;
@override@JsonKey() final  WifiConnectionState connectionState;
@override@JsonKey() final  bool isLoading;
 final  List<ChatMessage> _messages;
@override@JsonKey() List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  String? error;

/// Create a copy of WifiClientState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiClientStateCopyWith<_WifiClientState> get copyWith => __$WifiClientStateCopyWithImpl<_WifiClientState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiClientState&&const DeepCollectionEquality().equals(other._devices, _devices)&&(identical(other.isDiscovering, isDiscovering) || other.isDiscovering == isDiscovering)&&(identical(other.connectionState, connectionState) || other.connectionState == connectionState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices),isDiscovering,connectionState,isLoading,const DeepCollectionEquality().hash(_messages),error);

@override
String toString() {
  return 'WifiClientState(devices: $devices, isDiscovering: $isDiscovering, connectionState: $connectionState, isLoading: $isLoading, messages: $messages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WifiClientStateCopyWith<$Res> implements $WifiClientStateCopyWith<$Res> {
  factory _$WifiClientStateCopyWith(_WifiClientState value, $Res Function(_WifiClientState) _then) = __$WifiClientStateCopyWithImpl;
@override @useResult
$Res call({
 List<WifiDevice> devices, bool isDiscovering, WifiConnectionState connectionState, bool isLoading, List<ChatMessage> messages, String? error
});




}
/// @nodoc
class __$WifiClientStateCopyWithImpl<$Res>
    implements _$WifiClientStateCopyWith<$Res> {
  __$WifiClientStateCopyWithImpl(this._self, this._then);

  final _WifiClientState _self;
  final $Res Function(_WifiClientState) _then;

/// Create a copy of WifiClientState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? devices = null,Object? isDiscovering = null,Object? connectionState = null,Object? isLoading = null,Object? messages = null,Object? error = freezed,}) {
  return _then(_WifiClientState(
devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<WifiDevice>,isDiscovering: null == isDiscovering ? _self.isDiscovering : isDiscovering // ignore: cast_nullable_to_non_nullable
as bool,connectionState: null == connectionState ? _self.connectionState : connectionState // ignore: cast_nullable_to_non_nullable
as WifiConnectionState,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
