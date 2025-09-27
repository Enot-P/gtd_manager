// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_details_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteDetailsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteDetailsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteDetailsState()';
}


}

/// @nodoc
class $NoteDetailsStateCopyWith<$Res>  {
$NoteDetailsStateCopyWith(NoteDetailsState _, $Res Function(NoteDetailsState) __);
}


/// Adds pattern-matching-related methods to [NoteDetailsState].
extension NoteDetailsStatePatterns on NoteDetailsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NoteDetailsLoading value)?  loading,TResult Function( _NoteDetailsLoaded value)?  loaded,TResult Function( _NoteDetailsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteDetailsLoading() when loading != null:
return loading(_that);case _NoteDetailsLoaded() when loaded != null:
return loaded(_that);case _NoteDetailsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NoteDetailsLoading value)  loading,required TResult Function( _NoteDetailsLoaded value)  loaded,required TResult Function( _NoteDetailsError value)  error,}){
final _that = this;
switch (_that) {
case _NoteDetailsLoading():
return loading(_that);case _NoteDetailsLoaded():
return loaded(_that);case _NoteDetailsError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NoteDetailsLoading value)?  loading,TResult? Function( _NoteDetailsLoaded value)?  loaded,TResult? Function( _NoteDetailsError value)?  error,}){
final _that = this;
switch (_that) {
case _NoteDetailsLoading() when loading != null:
return loading(_that);case _NoteDetailsLoaded() when loaded != null:
return loaded(_that);case _NoteDetailsError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( NoteEntity note)?  loaded,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteDetailsLoading() when loading != null:
return loading();case _NoteDetailsLoaded() when loaded != null:
return loaded(_that.note);case _NoteDetailsError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( NoteEntity note)  loaded,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case _NoteDetailsLoading():
return loading();case _NoteDetailsLoaded():
return loaded(_that.note);case _NoteDetailsError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( NoteEntity note)?  loaded,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case _NoteDetailsLoading() when loading != null:
return loading();case _NoteDetailsLoaded() when loaded != null:
return loaded(_that.note);case _NoteDetailsError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _NoteDetailsLoading implements NoteDetailsState {
  const _NoteDetailsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteDetailsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NoteDetailsState.loading()';
}


}




/// @nodoc


class _NoteDetailsLoaded implements NoteDetailsState {
  const _NoteDetailsLoaded({required this.note});
  

 final  NoteEntity note;

/// Create a copy of NoteDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteDetailsLoadedCopyWith<_NoteDetailsLoaded> get copyWith => __$NoteDetailsLoadedCopyWithImpl<_NoteDetailsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteDetailsLoaded&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'NoteDetailsState.loaded(note: $note)';
}


}

/// @nodoc
abstract mixin class _$NoteDetailsLoadedCopyWith<$Res> implements $NoteDetailsStateCopyWith<$Res> {
  factory _$NoteDetailsLoadedCopyWith(_NoteDetailsLoaded value, $Res Function(_NoteDetailsLoaded) _then) = __$NoteDetailsLoadedCopyWithImpl;
@useResult
$Res call({
 NoteEntity note
});


$NoteEntityCopyWith<$Res> get note;

}
/// @nodoc
class __$NoteDetailsLoadedCopyWithImpl<$Res>
    implements _$NoteDetailsLoadedCopyWith<$Res> {
  __$NoteDetailsLoadedCopyWithImpl(this._self, this._then);

  final _NoteDetailsLoaded _self;
  final $Res Function(_NoteDetailsLoaded) _then;

/// Create a copy of NoteDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(_NoteDetailsLoaded(
note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as NoteEntity,
  ));
}

/// Create a copy of NoteDetailsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NoteEntityCopyWith<$Res> get note {
  
  return $NoteEntityCopyWith<$Res>(_self.note, (value) {
    return _then(_self.copyWith(note: value));
  });
}
}

/// @nodoc


class _NoteDetailsError implements NoteDetailsState {
  const _NoteDetailsError(this.message);
  

 final  String message;

/// Create a copy of NoteDetailsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteDetailsErrorCopyWith<_NoteDetailsError> get copyWith => __$NoteDetailsErrorCopyWithImpl<_NoteDetailsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteDetailsError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NoteDetailsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NoteDetailsErrorCopyWith<$Res> implements $NoteDetailsStateCopyWith<$Res> {
  factory _$NoteDetailsErrorCopyWith(_NoteDetailsError value, $Res Function(_NoteDetailsError) _then) = __$NoteDetailsErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NoteDetailsErrorCopyWithImpl<$Res>
    implements _$NoteDetailsErrorCopyWith<$Res> {
  __$NoteDetailsErrorCopyWithImpl(this._self, this._then);

  final _NoteDetailsError _self;
  final $Res Function(_NoteDetailsError) _then;

/// Create a copy of NoteDetailsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NoteDetailsError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
