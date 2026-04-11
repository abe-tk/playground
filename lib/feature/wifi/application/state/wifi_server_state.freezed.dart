// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_server_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WifiServerState {

 bool get isRunning; bool get isLoading; int get connectedClientCount; List<ChatMessage> get messages; String? get error;
/// Create a copy of WifiServerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiServerStateCopyWith<WifiServerState> get copyWith => _$WifiServerStateCopyWithImpl<WifiServerState>(this as WifiServerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiServerState&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.connectedClientCount, connectedClientCount) || other.connectedClientCount == connectedClientCount)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isRunning,isLoading,connectedClientCount,const DeepCollectionEquality().hash(messages),error);

@override
String toString() {
  return 'WifiServerState(isRunning: $isRunning, isLoading: $isLoading, connectedClientCount: $connectedClientCount, messages: $messages, error: $error)';
}


}

/// @nodoc
abstract mixin class $WifiServerStateCopyWith<$Res>  {
  factory $WifiServerStateCopyWith(WifiServerState value, $Res Function(WifiServerState) _then) = _$WifiServerStateCopyWithImpl;
@useResult
$Res call({
 bool isRunning, bool isLoading, int connectedClientCount, List<ChatMessage> messages, String? error
});




}
/// @nodoc
class _$WifiServerStateCopyWithImpl<$Res>
    implements $WifiServerStateCopyWith<$Res> {
  _$WifiServerStateCopyWithImpl(this._self, this._then);

  final WifiServerState _self;
  final $Res Function(WifiServerState) _then;

/// Create a copy of WifiServerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isRunning = null,Object? isLoading = null,Object? connectedClientCount = null,Object? messages = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,connectedClientCount: null == connectedClientCount ? _self.connectedClientCount : connectedClientCount // ignore: cast_nullable_to_non_nullable
as int,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WifiServerState].
extension WifiServerStatePatterns on WifiServerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiServerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiServerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiServerState value)  $default,){
final _that = this;
switch (_that) {
case _WifiServerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiServerState value)?  $default,){
final _that = this;
switch (_that) {
case _WifiServerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isRunning,  bool isLoading,  int connectedClientCount,  List<ChatMessage> messages,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiServerState() when $default != null:
return $default(_that.isRunning,_that.isLoading,_that.connectedClientCount,_that.messages,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isRunning,  bool isLoading,  int connectedClientCount,  List<ChatMessage> messages,  String? error)  $default,) {final _that = this;
switch (_that) {
case _WifiServerState():
return $default(_that.isRunning,_that.isLoading,_that.connectedClientCount,_that.messages,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isRunning,  bool isLoading,  int connectedClientCount,  List<ChatMessage> messages,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _WifiServerState() when $default != null:
return $default(_that.isRunning,_that.isLoading,_that.connectedClientCount,_that.messages,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _WifiServerState implements WifiServerState {
  const _WifiServerState({this.isRunning = false, this.isLoading = false, this.connectedClientCount = 0, final  List<ChatMessage> messages = const [], this.error}): _messages = messages;
  

@override@JsonKey() final  bool isRunning;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  int connectedClientCount;
 final  List<ChatMessage> _messages;
@override@JsonKey() List<ChatMessage> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override final  String? error;

/// Create a copy of WifiServerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiServerStateCopyWith<_WifiServerState> get copyWith => __$WifiServerStateCopyWithImpl<_WifiServerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiServerState&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.connectedClientCount, connectedClientCount) || other.connectedClientCount == connectedClientCount)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isRunning,isLoading,connectedClientCount,const DeepCollectionEquality().hash(_messages),error);

@override
String toString() {
  return 'WifiServerState(isRunning: $isRunning, isLoading: $isLoading, connectedClientCount: $connectedClientCount, messages: $messages, error: $error)';
}


}

/// @nodoc
abstract mixin class _$WifiServerStateCopyWith<$Res> implements $WifiServerStateCopyWith<$Res> {
  factory _$WifiServerStateCopyWith(_WifiServerState value, $Res Function(_WifiServerState) _then) = __$WifiServerStateCopyWithImpl;
@override @useResult
$Res call({
 bool isRunning, bool isLoading, int connectedClientCount, List<ChatMessage> messages, String? error
});




}
/// @nodoc
class __$WifiServerStateCopyWithImpl<$Res>
    implements _$WifiServerStateCopyWith<$Res> {
  __$WifiServerStateCopyWithImpl(this._self, this._then);

  final _WifiServerState _self;
  final $Res Function(_WifiServerState) _then;

/// Create a copy of WifiServerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isRunning = null,Object? isLoading = null,Object? connectedClientCount = null,Object? messages = null,Object? error = freezed,}) {
  return _then(_WifiServerState(
isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,connectedClientCount: null == connectedClientCount ? _self.connectedClientCount : connectedClientCount // ignore: cast_nullable_to_non_nullable
as int,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessage>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
