// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'note_create_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NoteCreateDto {

 String get title; NoteCategory get noteCategory; String? get description; int? get projectId;
/// Create a copy of NoteCreateDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoteCreateDtoCopyWith<NoteCreateDto> get copyWith => _$NoteCreateDtoCopyWithImpl<NoteCreateDto>(this as NoteCreateDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoteCreateDto&&(identical(other.title, title) || other.title == title)&&(identical(other.noteCategory, noteCategory) || other.noteCategory == noteCategory)&&(identical(other.description, description) || other.description == description)&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,title,noteCategory,description,projectId);

@override
String toString() {
  return 'NoteCreateDto(title: $title, noteCategory: $noteCategory, description: $description, projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class $NoteCreateDtoCopyWith<$Res>  {
  factory $NoteCreateDtoCopyWith(NoteCreateDto value, $Res Function(NoteCreateDto) _then) = _$NoteCreateDtoCopyWithImpl;
@useResult
$Res call({
 String title, NoteCategory noteCategory, String? description, int? projectId
});




}
/// @nodoc
class _$NoteCreateDtoCopyWithImpl<$Res>
    implements $NoteCreateDtoCopyWith<$Res> {
  _$NoteCreateDtoCopyWithImpl(this._self, this._then);

  final NoteCreateDto _self;
  final $Res Function(NoteCreateDto) _then;

/// Create a copy of NoteCreateDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? noteCategory = null,Object? description = freezed,Object? projectId = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,noteCategory: null == noteCategory ? _self.noteCategory : noteCategory // ignore: cast_nullable_to_non_nullable
as NoteCategory,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [NoteCreateDto].
extension NoteCreateDtoPatterns on NoteCreateDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NoteCreateDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NoteCreateDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NoteCreateDto value)  $default,){
final _that = this;
switch (_that) {
case _NoteCreateDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NoteCreateDto value)?  $default,){
final _that = this;
switch (_that) {
case _NoteCreateDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  NoteCategory noteCategory,  String? description,  int? projectId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NoteCreateDto() when $default != null:
return $default(_that.title,_that.noteCategory,_that.description,_that.projectId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  NoteCategory noteCategory,  String? description,  int? projectId)  $default,) {final _that = this;
switch (_that) {
case _NoteCreateDto():
return $default(_that.title,_that.noteCategory,_that.description,_that.projectId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  NoteCategory noteCategory,  String? description,  int? projectId)?  $default,) {final _that = this;
switch (_that) {
case _NoteCreateDto() when $default != null:
return $default(_that.title,_that.noteCategory,_that.description,_that.projectId);case _:
  return null;

}
}

}

/// @nodoc


class _NoteCreateDto implements NoteCreateDto {
   _NoteCreateDto({required this.title, required this.noteCategory, this.description, this.projectId});
  

@override final  String title;
@override final  NoteCategory noteCategory;
@override final  String? description;
@override final  int? projectId;

/// Create a copy of NoteCreateDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NoteCreateDtoCopyWith<_NoteCreateDto> get copyWith => __$NoteCreateDtoCopyWithImpl<_NoteCreateDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoteCreateDto&&(identical(other.title, title) || other.title == title)&&(identical(other.noteCategory, noteCategory) || other.noteCategory == noteCategory)&&(identical(other.description, description) || other.description == description)&&(identical(other.projectId, projectId) || other.projectId == projectId));
}


@override
int get hashCode => Object.hash(runtimeType,title,noteCategory,description,projectId);

@override
String toString() {
  return 'NoteCreateDto(title: $title, noteCategory: $noteCategory, description: $description, projectId: $projectId)';
}


}

/// @nodoc
abstract mixin class _$NoteCreateDtoCopyWith<$Res> implements $NoteCreateDtoCopyWith<$Res> {
  factory _$NoteCreateDtoCopyWith(_NoteCreateDto value, $Res Function(_NoteCreateDto) _then) = __$NoteCreateDtoCopyWithImpl;
@override @useResult
$Res call({
 String title, NoteCategory noteCategory, String? description, int? projectId
});




}
/// @nodoc
class __$NoteCreateDtoCopyWithImpl<$Res>
    implements _$NoteCreateDtoCopyWith<$Res> {
  __$NoteCreateDtoCopyWithImpl(this._self, this._then);

  final _NoteCreateDto _self;
  final $Res Function(_NoteCreateDto) _then;

/// Create a copy of NoteCreateDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? noteCategory = null,Object? description = freezed,Object? projectId = freezed,}) {
  return _then(_NoteCreateDto(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,noteCategory: null == noteCategory ? _self.noteCategory : noteCategory // ignore: cast_nullable_to_non_nullable
as NoteCategory,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,projectId: freezed == projectId ? _self.projectId : projectId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
