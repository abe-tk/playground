// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ble_gatt_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BleGattService {

 String get uuid; bool get isPrimary; List<BleGattCharacteristic> get characteristics;
/// Create a copy of BleGattService
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BleGattServiceCopyWith<BleGattService> get copyWith => _$BleGattServiceCopyWithImpl<BleGattService>(this as BleGattService, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BleGattService&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&const DeepCollectionEquality().equals(other.characteristics, characteristics));
}


@override
int get hashCode => Object.hash(runtimeType,uuid,isPrimary,const DeepCollectionEquality().hash(characteristics));

@override
String toString() {
  return 'BleGattService(uuid: $uuid, isPrimary: $isPrimary, characteristics: $characteristics)';
}


}

/// @nodoc
abstract mixin class $BleGattServiceCopyWith<$Res>  {
  factory $BleGattServiceCopyWith(BleGattService value, $Res Function(BleGattService) _then) = _$BleGattServiceCopyWithImpl;
@useResult
$Res call({
 String uuid, bool isPrimary, List<BleGattCharacteristic> characteristics
});




}
/// @nodoc
class _$BleGattServiceCopyWithImpl<$Res>
    implements $BleGattServiceCopyWith<$Res> {
  _$BleGattServiceCopyWithImpl(this._self, this._then);

  final BleGattService _self;
  final $Res Function(BleGattService) _then;

/// Create a copy of BleGattService
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? isPrimary = null,Object? characteristics = null,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,characteristics: null == characteristics ? _self.characteristics : characteristics // ignore: cast_nullable_to_non_nullable
as List<BleGattCharacteristic>,
  ));
}

}


/// Adds pattern-matching-related methods to [BleGattService].
extension BleGattServicePatterns on BleGattService {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BleGattService value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BleGattService() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BleGattService value)  $default,){
final _that = this;
switch (_that) {
case _BleGattService():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BleGattService value)?  $default,){
final _that = this;
switch (_that) {
case _BleGattService() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  bool isPrimary,  List<BleGattCharacteristic> characteristics)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BleGattService() when $default != null:
return $default(_that.uuid,_that.isPrimary,_that.characteristics);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  bool isPrimary,  List<BleGattCharacteristic> characteristics)  $default,) {final _that = this;
switch (_that) {
case _BleGattService():
return $default(_that.uuid,_that.isPrimary,_that.characteristics);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  bool isPrimary,  List<BleGattCharacteristic> characteristics)?  $default,) {final _that = this;
switch (_that) {
case _BleGattService() when $default != null:
return $default(_that.uuid,_that.isPrimary,_that.characteristics);case _:
  return null;

}
}

}

/// @nodoc


class _BleGattService implements BleGattService {
  const _BleGattService({required this.uuid, required this.isPrimary, final  List<BleGattCharacteristic> characteristics = const []}): _characteristics = characteristics;
  

@override final  String uuid;
@override final  bool isPrimary;
 final  List<BleGattCharacteristic> _characteristics;
@override@JsonKey() List<BleGattCharacteristic> get characteristics {
  if (_characteristics is EqualUnmodifiableListView) return _characteristics;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_characteristics);
}


/// Create a copy of BleGattService
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BleGattServiceCopyWith<_BleGattService> get copyWith => __$BleGattServiceCopyWithImpl<_BleGattService>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BleGattService&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.isPrimary, isPrimary) || other.isPrimary == isPrimary)&&const DeepCollectionEquality().equals(other._characteristics, _characteristics));
}


@override
int get hashCode => Object.hash(runtimeType,uuid,isPrimary,const DeepCollectionEquality().hash(_characteristics));

@override
String toString() {
  return 'BleGattService(uuid: $uuid, isPrimary: $isPrimary, characteristics: $characteristics)';
}


}

/// @nodoc
abstract mixin class _$BleGattServiceCopyWith<$Res> implements $BleGattServiceCopyWith<$Res> {
  factory _$BleGattServiceCopyWith(_BleGattService value, $Res Function(_BleGattService) _then) = __$BleGattServiceCopyWithImpl;
@override @useResult
$Res call({
 String uuid, bool isPrimary, List<BleGattCharacteristic> characteristics
});




}
/// @nodoc
class __$BleGattServiceCopyWithImpl<$Res>
    implements _$BleGattServiceCopyWith<$Res> {
  __$BleGattServiceCopyWithImpl(this._self, this._then);

  final _BleGattService _self;
  final $Res Function(_BleGattService) _then;

/// Create a copy of BleGattService
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? isPrimary = null,Object? characteristics = null,}) {
  return _then(_BleGattService(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,isPrimary: null == isPrimary ? _self.isPrimary : isPrimary // ignore: cast_nullable_to_non_nullable
as bool,characteristics: null == characteristics ? _self._characteristics : characteristics // ignore: cast_nullable_to_non_nullable
as List<BleGattCharacteristic>,
  ));
}


}

// dart format on
