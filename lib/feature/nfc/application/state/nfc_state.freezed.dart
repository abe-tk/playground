// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nfc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NfcState {

 NfcAvailability get availability; bool get isReading; bool get isWriting; List<NfcRecord> get readRecords; String? get writeResult; String? get error;
/// Create a copy of NfcState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NfcStateCopyWith<NfcState> get copyWith => _$NfcStateCopyWithImpl<NfcState>(this as NfcState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NfcState&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.isReading, isReading) || other.isReading == isReading)&&(identical(other.isWriting, isWriting) || other.isWriting == isWriting)&&const DeepCollectionEquality().equals(other.readRecords, readRecords)&&(identical(other.writeResult, writeResult) || other.writeResult == writeResult)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,availability,isReading,isWriting,const DeepCollectionEquality().hash(readRecords),writeResult,error);

@override
String toString() {
  return 'NfcState(availability: $availability, isReading: $isReading, isWriting: $isWriting, readRecords: $readRecords, writeResult: $writeResult, error: $error)';
}


}

/// @nodoc
abstract mixin class $NfcStateCopyWith<$Res>  {
  factory $NfcStateCopyWith(NfcState value, $Res Function(NfcState) _then) = _$NfcStateCopyWithImpl;
@useResult
$Res call({
 NfcAvailability availability, bool isReading, bool isWriting, List<NfcRecord> readRecords, String? writeResult, String? error
});




}
/// @nodoc
class _$NfcStateCopyWithImpl<$Res>
    implements $NfcStateCopyWith<$Res> {
  _$NfcStateCopyWithImpl(this._self, this._then);

  final NfcState _self;
  final $Res Function(NfcState) _then;

/// Create a copy of NfcState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availability = null,Object? isReading = null,Object? isWriting = null,Object? readRecords = null,Object? writeResult = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as NfcAvailability,isReading: null == isReading ? _self.isReading : isReading // ignore: cast_nullable_to_non_nullable
as bool,isWriting: null == isWriting ? _self.isWriting : isWriting // ignore: cast_nullable_to_non_nullable
as bool,readRecords: null == readRecords ? _self.readRecords : readRecords // ignore: cast_nullable_to_non_nullable
as List<NfcRecord>,writeResult: freezed == writeResult ? _self.writeResult : writeResult // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NfcState].
extension NfcStatePatterns on NfcState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NfcState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NfcState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NfcState value)  $default,){
final _that = this;
switch (_that) {
case _NfcState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NfcState value)?  $default,){
final _that = this;
switch (_that) {
case _NfcState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( NfcAvailability availability,  bool isReading,  bool isWriting,  List<NfcRecord> readRecords,  String? writeResult,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NfcState() when $default != null:
return $default(_that.availability,_that.isReading,_that.isWriting,_that.readRecords,_that.writeResult,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( NfcAvailability availability,  bool isReading,  bool isWriting,  List<NfcRecord> readRecords,  String? writeResult,  String? error)  $default,) {final _that = this;
switch (_that) {
case _NfcState():
return $default(_that.availability,_that.isReading,_that.isWriting,_that.readRecords,_that.writeResult,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( NfcAvailability availability,  bool isReading,  bool isWriting,  List<NfcRecord> readRecords,  String? writeResult,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _NfcState() when $default != null:
return $default(_that.availability,_that.isReading,_that.isWriting,_that.readRecords,_that.writeResult,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _NfcState implements NfcState {
  const _NfcState({this.availability = NfcAvailability.unsupported, this.isReading = false, this.isWriting = false, final  List<NfcRecord> readRecords = const [], this.writeResult, this.error}): _readRecords = readRecords;
  

@override@JsonKey() final  NfcAvailability availability;
@override@JsonKey() final  bool isReading;
@override@JsonKey() final  bool isWriting;
 final  List<NfcRecord> _readRecords;
@override@JsonKey() List<NfcRecord> get readRecords {
  if (_readRecords is EqualUnmodifiableListView) return _readRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readRecords);
}

@override final  String? writeResult;
@override final  String? error;

/// Create a copy of NfcState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NfcStateCopyWith<_NfcState> get copyWith => __$NfcStateCopyWithImpl<_NfcState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NfcState&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.isReading, isReading) || other.isReading == isReading)&&(identical(other.isWriting, isWriting) || other.isWriting == isWriting)&&const DeepCollectionEquality().equals(other._readRecords, _readRecords)&&(identical(other.writeResult, writeResult) || other.writeResult == writeResult)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,availability,isReading,isWriting,const DeepCollectionEquality().hash(_readRecords),writeResult,error);

@override
String toString() {
  return 'NfcState(availability: $availability, isReading: $isReading, isWriting: $isWriting, readRecords: $readRecords, writeResult: $writeResult, error: $error)';
}


}

/// @nodoc
abstract mixin class _$NfcStateCopyWith<$Res> implements $NfcStateCopyWith<$Res> {
  factory _$NfcStateCopyWith(_NfcState value, $Res Function(_NfcState) _then) = __$NfcStateCopyWithImpl;
@override @useResult
$Res call({
 NfcAvailability availability, bool isReading, bool isWriting, List<NfcRecord> readRecords, String? writeResult, String? error
});




}
/// @nodoc
class __$NfcStateCopyWithImpl<$Res>
    implements _$NfcStateCopyWith<$Res> {
  __$NfcStateCopyWithImpl(this._self, this._then);

  final _NfcState _self;
  final $Res Function(_NfcState) _then;

/// Create a copy of NfcState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availability = null,Object? isReading = null,Object? isWriting = null,Object? readRecords = null,Object? writeResult = freezed,Object? error = freezed,}) {
  return _then(_NfcState(
availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as NfcAvailability,isReading: null == isReading ? _self.isReading : isReading // ignore: cast_nullable_to_non_nullable
as bool,isWriting: null == isWriting ? _self.isWriting : isWriting // ignore: cast_nullable_to_non_nullable
as bool,readRecords: null == readRecords ? _self._readRecords : readRecords // ignore: cast_nullable_to_non_nullable
as List<NfcRecord>,writeResult: freezed == writeResult ? _self.writeResult : writeResult // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
