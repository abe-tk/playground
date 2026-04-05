// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_gatt_characteristic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BleGattCharacteristic {

 String get uuid; List<BleCharacteristicProperty> get properties;
/// Create a copy of BleGattCharacteristic
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BleGattCharacteristicCopyWith<BleGattCharacteristic> get copyWith => _$BleGattCharacteristicCopyWithImpl<BleGattCharacteristic>(this as BleGattCharacteristic, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleGattCharacteristic&&(identical(other.uuid, uuid) || other.uuid == uuid)&&const DeepCollectionEquality().equals(other.properties, properties));
}


@override
int get hashCode => Object.hash(runtimeType,uuid,const DeepCollectionEquality().hash(properties));

@override
String toString() {
  return 'BleGattCharacteristic(uuid: $uuid, properties: $properties)';
}


}

/// @nodoc
abstract mixin class $BleGattCharacteristicCopyWith<$Res>  {
  factory $BleGattCharacteristicCopyWith(BleGattCharacteristic value, $Res Function(BleGattCharacteristic) _then) = _$BleGattCharacteristicCopyWithImpl;
@useResult
$Res call({
 String uuid, List<BleCharacteristicProperty> properties
});




}
/// @nodoc
class _$BleGattCharacteristicCopyWithImpl<$Res>
    implements $BleGattCharacteristicCopyWith<$Res> {
  _$BleGattCharacteristicCopyWithImpl(this._self, this._then);

  final BleGattCharacteristic _self;
  final $Res Function(BleGattCharacteristic) _then;

/// Create a copy of BleGattCharacteristic
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? properties = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,properties: null == properties ? _self.properties : properties // ignore: cast_nullable_to_non_nullable
as List<BleCharacteristicProperty>,
  ));
}

}


/// Adds pattern-matching-related methods to [BleGattCharacteristic].
extension BleGattCharacteristicPatterns on BleGattCharacteristic {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BleGattCharacteristic value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BleGattCharacteristic() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BleGattCharacteristic value)  $default,){
final _that = this;
switch (_that) {
case _BleGattCharacteristic():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BleGattCharacteristic value)?  $default,){
final _that = this;
switch (_that) {
case _BleGattCharacteristic() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  List<BleCharacteristicProperty> properties)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BleGattCharacteristic() when $default != null:
return $default(_that.uuid,_that.properties);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  List<BleCharacteristicProperty> properties)  $default,) {final _that = this;
switch (_that) {
case _BleGattCharacteristic():
return $default(_that.uuid,_that.properties);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  List<BleCharacteristicProperty> properties)?  $default,) {final _that = this;
switch (_that) {
case _BleGattCharacteristic() when $default != null:
return $default(_that.uuid,_that.properties);case _:
  return null;

}
}

}

/// @nodoc


class _BleGattCharacteristic implements BleGattCharacteristic {
  const _BleGattCharacteristic({required this.uuid, final  List<BleCharacteristicProperty> properties = const []}): _properties = properties;
  

@override final  String uuid;
 final  List<BleCharacteristicProperty> _properties;
@override@JsonKey() List<BleCharacteristicProperty> get properties {
  if (_properties is EqualUnmodifiableListView) return _properties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_properties);
}


/// Create a copy of BleGattCharacteristic
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BleGattCharacteristicCopyWith<_BleGattCharacteristic> get copyWith => __$BleGattCharacteristicCopyWithImpl<_BleGattCharacteristic>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BleGattCharacteristic&&(identical(other.uuid, uuid) || other.uuid == uuid)&&const DeepCollectionEquality().equals(other._properties, _properties));
}


@override
int get hashCode => Object.hash(runtimeType,uuid,const DeepCollectionEquality().hash(_properties));

@override
String toString() {
  return 'BleGattCharacteristic(uuid: $uuid, properties: $properties)';
}


}

/// @nodoc
abstract mixin class _$BleGattCharacteristicCopyWith<$Res> implements $BleGattCharacteristicCopyWith<$Res> {
  factory _$BleGattCharacteristicCopyWith(_BleGattCharacteristic value, $Res Function(_BleGattCharacteristic) _then) = __$BleGattCharacteristicCopyWithImpl;
@override @useResult
$Res call({
 String uuid, List<BleCharacteristicProperty> properties
});




}
/// @nodoc
class __$BleGattCharacteristicCopyWithImpl<$Res>
    implements _$BleGattCharacteristicCopyWith<$Res> {
  __$BleGattCharacteristicCopyWithImpl(this._self, this._then);

  final _BleGattCharacteristic _self;
  final $Res Function(_BleGattCharacteristic) _then;

/// Create a copy of BleGattCharacteristic
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? properties = null,}) {
  return _then(_BleGattCharacteristic(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,properties: null == properties ? _self._properties : properties // ignore: cast_nullable_to_non_nullable
as List<BleCharacteristicProperty>,
  ));
}


}

// dart format on
