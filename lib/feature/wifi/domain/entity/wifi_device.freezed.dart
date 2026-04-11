// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wifi_device.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WifiDevice {

 String get name; String get host; int get port;
/// Create a copy of WifiDevice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WifiDeviceCopyWith<WifiDevice> get copyWith => _$WifiDeviceCopyWithImpl<WifiDevice>(this as WifiDevice, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WifiDevice&&(identical(other.name, name) || other.name == name)&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port));
}


@override
int get hashCode => Object.hash(runtimeType,name,host,port);

@override
String toString() {
  return 'WifiDevice(name: $name, host: $host, port: $port)';
}


}

/// @nodoc
abstract mixin class $WifiDeviceCopyWith<$Res>  {
  factory $WifiDeviceCopyWith(WifiDevice value, $Res Function(WifiDevice) _then) = _$WifiDeviceCopyWithImpl;
@useResult
$Res call({
 String name, String host, int port
});




}
/// @nodoc
class _$WifiDeviceCopyWithImpl<$Res>
    implements $WifiDeviceCopyWith<$Res> {
  _$WifiDeviceCopyWithImpl(this._self, this._then);

  final WifiDevice _self;
  final $Res Function(WifiDevice) _then;

/// Create a copy of WifiDevice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? host = null,Object? port = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WifiDevice].
extension WifiDevicePatterns on WifiDevice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WifiDevice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WifiDevice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WifiDevice value)  $default,){
final _that = this;
switch (_that) {
case _WifiDevice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WifiDevice value)?  $default,){
final _that = this;
switch (_that) {
case _WifiDevice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String host,  int port)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WifiDevice() when $default != null:
return $default(_that.name,_that.host,_that.port);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String host,  int port)  $default,) {final _that = this;
switch (_that) {
case _WifiDevice():
return $default(_that.name,_that.host,_that.port);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String host,  int port)?  $default,) {final _that = this;
switch (_that) {
case _WifiDevice() when $default != null:
return $default(_that.name,_that.host,_that.port);case _:
  return null;

}
}

}

/// @nodoc


class _WifiDevice implements WifiDevice {
  const _WifiDevice({required this.name, required this.host, required this.port});
  

@override final  String name;
@override final  String host;
@override final  int port;

/// Create a copy of WifiDevice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WifiDeviceCopyWith<_WifiDevice> get copyWith => __$WifiDeviceCopyWithImpl<_WifiDevice>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WifiDevice&&(identical(other.name, name) || other.name == name)&&(identical(other.host, host) || other.host == host)&&(identical(other.port, port) || other.port == port));
}


@override
int get hashCode => Object.hash(runtimeType,name,host,port);

@override
String toString() {
  return 'WifiDevice(name: $name, host: $host, port: $port)';
}


}

/// @nodoc
abstract mixin class _$WifiDeviceCopyWith<$Res> implements $WifiDeviceCopyWith<$Res> {
  factory _$WifiDeviceCopyWith(_WifiDevice value, $Res Function(_WifiDevice) _then) = __$WifiDeviceCopyWithImpl;
@override @useResult
$Res call({
 String name, String host, int port
});




}
/// @nodoc
class __$WifiDeviceCopyWithImpl<$Res>
    implements _$WifiDeviceCopyWith<$Res> {
  __$WifiDeviceCopyWithImpl(this._self, this._then);

  final _WifiDevice _self;
  final $Res Function(_WifiDevice) _then;

/// Create a copy of WifiDevice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? host = null,Object? port = null,}) {
  return _then(_WifiDevice(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,host: null == host ? _self.host : host // ignore: cast_nullable_to_non_nullable
as String,port: null == port ? _self.port : port // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
