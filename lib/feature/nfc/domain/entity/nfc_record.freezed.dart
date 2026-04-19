// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nfc_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NfcRecord {

 NfcRecordKind get kind; String get payload;
/// Create a copy of NfcRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NfcRecordCopyWith<NfcRecord> get copyWith => _$NfcRecordCopyWithImpl<NfcRecord>(this as NfcRecord, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NfcRecord&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.payload, payload) || other.payload == payload));
}


@override
int get hashCode => Object.hash(runtimeType,kind,payload);

@override
String toString() {
  return 'NfcRecord(kind: $kind, payload: $payload)';
}


}

/// @nodoc
abstract mixin class $NfcRecordCopyWith<$Res>  {
  factory $NfcRecordCopyWith(NfcRecord value, $Res Function(NfcRecord) _then) = _$NfcRecordCopyWithImpl;
@useResult
$Res call({
 NfcRecordKind kind, String payload
});




}
/// @nodoc
class _$NfcRecordCopyWithImpl<$Res>
    implements $NfcRecordCopyWith<$Res> {
  _$NfcRecordCopyWithImpl(this._self, this._then);

  final NfcRecord _self;
  final $Res Function(NfcRecord) _then;

/// Create a copy of NfcRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? payload = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NfcRecordKind,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [NfcRecord].
extension NfcRecordPatterns on NfcRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NfcRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NfcRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NfcRecord value)  $default,){
final _that = this;
switch (_that) {
case _NfcRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NfcRecord value)?  $default,){
final _that = this;
switch (_that) {
case _NfcRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NfcRecordKind kind,  String payload)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NfcRecord() when $default != null:
return $default(_that.kind,_that.payload);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NfcRecordKind kind,  String payload)  $default,) {final _that = this;
switch (_that) {
case _NfcRecord():
return $default(_that.kind,_that.payload);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NfcRecordKind kind,  String payload)?  $default,) {final _that = this;
switch (_that) {
case _NfcRecord() when $default != null:
return $default(_that.kind,_that.payload);case _:
  return null;

}
}

}

/// @nodoc


class _NfcRecord implements NfcRecord {
  const _NfcRecord({required this.kind, required this.payload});
  

@override final  NfcRecordKind kind;
@override final  String payload;

/// Create a copy of NfcRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NfcRecordCopyWith<_NfcRecord> get copyWith => __$NfcRecordCopyWithImpl<_NfcRecord>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NfcRecord&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.payload, payload) || other.payload == payload));
}


@override
int get hashCode => Object.hash(runtimeType,kind,payload);

@override
String toString() {
  return 'NfcRecord(kind: $kind, payload: $payload)';
}


}

/// @nodoc
abstract mixin class _$NfcRecordCopyWith<$Res> implements $NfcRecordCopyWith<$Res> {
  factory _$NfcRecordCopyWith(_NfcRecord value, $Res Function(_NfcRecord) _then) = __$NfcRecordCopyWithImpl;
@override @useResult
$Res call({
 NfcRecordKind kind, String payload
});




}
/// @nodoc
class __$NfcRecordCopyWithImpl<$Res>
    implements _$NfcRecordCopyWith<$Res> {
  __$NfcRecordCopyWithImpl(this._self, this._then);

  final _NfcRecord _self;
  final $Res Function(_NfcRecord) _then;

/// Create a copy of NfcRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? payload = null,}) {
  return _then(_NfcRecord(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as NfcRecordKind,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
