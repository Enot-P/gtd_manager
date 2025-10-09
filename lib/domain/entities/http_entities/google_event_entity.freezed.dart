// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_event_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoogleEventEntity {

/// Уникальный ID события
 String get id;/// Название события
 String get summary;/// Описание события
 String? get description;/// Список правил повторения (RRULE, EXDATE и т.д.)
// @Default([]) List<String> recurrence,
/// Время начала события
 GoogleEventDateTime get start;
/// Create a copy of GoogleEventEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleEventEntityCopyWith<GoogleEventEntity> get copyWith => _$GoogleEventEntityCopyWithImpl<GoogleEventEntity>(this as GoogleEventEntity, _$identity);

  /// Serializes this GoogleEventEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleEventEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.description, description) || other.description == description)&&(identical(other.start, start) || other.start == start));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,summary,description,start);

@override
String toString() {
  return 'GoogleEventEntity(id: $id, summary: $summary, description: $description, start: $start)';
}


}

/// @nodoc
abstract mixin class $GoogleEventEntityCopyWith<$Res>  {
  factory $GoogleEventEntityCopyWith(GoogleEventEntity value, $Res Function(GoogleEventEntity) _then) = _$GoogleEventEntityCopyWithImpl;
@useResult
$Res call({
 String id, String summary, String? description, GoogleEventDateTime start
});


$GoogleEventDateTimeCopyWith<$Res> get start;

}
/// @nodoc
class _$GoogleEventEntityCopyWithImpl<$Res>
    implements $GoogleEventEntityCopyWith<$Res> {
  _$GoogleEventEntityCopyWithImpl(this._self, this._then);

  final GoogleEventEntity _self;
  final $Res Function(GoogleEventEntity) _then;

/// Create a copy of GoogleEventEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? summary = null,Object? description = freezed,Object? start = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as GoogleEventDateTime,
  ));
}
/// Create a copy of GoogleEventEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoogleEventDateTimeCopyWith<$Res> get start {
  
  return $GoogleEventDateTimeCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}
}


/// Adds pattern-matching-related methods to [GoogleEventEntity].
extension GoogleEventEntityPatterns on GoogleEventEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleEventEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleEventEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleEventEntity value)  $default,){
final _that = this;
switch (_that) {
case _GoogleEventEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleEventEntity value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleEventEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String summary,  String? description,  GoogleEventDateTime start)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleEventEntity() when $default != null:
return $default(_that.id,_that.summary,_that.description,_that.start);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String summary,  String? description,  GoogleEventDateTime start)  $default,) {final _that = this;
switch (_that) {
case _GoogleEventEntity():
return $default(_that.id,_that.summary,_that.description,_that.start);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String summary,  String? description,  GoogleEventDateTime start)?  $default,) {final _that = this;
switch (_that) {
case _GoogleEventEntity() when $default != null:
return $default(_that.id,_that.summary,_that.description,_that.start);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleEventEntity implements GoogleEventEntity {
  const _GoogleEventEntity({required this.id, required this.summary, this.description, required this.start});
  factory _GoogleEventEntity.fromJson(Map<String, dynamic> json) => _$GoogleEventEntityFromJson(json);

/// Уникальный ID события
@override final  String id;
/// Название события
@override final  String summary;
/// Описание события
@override final  String? description;
/// Список правил повторения (RRULE, EXDATE и т.д.)
// @Default([]) List<String> recurrence,
/// Время начала события
@override final  GoogleEventDateTime start;

/// Create a copy of GoogleEventEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleEventEntityCopyWith<_GoogleEventEntity> get copyWith => __$GoogleEventEntityCopyWithImpl<_GoogleEventEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleEventEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleEventEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.description, description) || other.description == description)&&(identical(other.start, start) || other.start == start));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,summary,description,start);

@override
String toString() {
  return 'GoogleEventEntity(id: $id, summary: $summary, description: $description, start: $start)';
}


}

/// @nodoc
abstract mixin class _$GoogleEventEntityCopyWith<$Res> implements $GoogleEventEntityCopyWith<$Res> {
  factory _$GoogleEventEntityCopyWith(_GoogleEventEntity value, $Res Function(_GoogleEventEntity) _then) = __$GoogleEventEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String summary, String? description, GoogleEventDateTime start
});


@override $GoogleEventDateTimeCopyWith<$Res> get start;

}
/// @nodoc
class __$GoogleEventEntityCopyWithImpl<$Res>
    implements _$GoogleEventEntityCopyWith<$Res> {
  __$GoogleEventEntityCopyWithImpl(this._self, this._then);

  final _GoogleEventEntity _self;
  final $Res Function(_GoogleEventEntity) _then;

/// Create a copy of GoogleEventEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? summary = null,Object? description = freezed,Object? start = null,}) {
  return _then(_GoogleEventEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as GoogleEventDateTime,
  ));
}

/// Create a copy of GoogleEventEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GoogleEventDateTimeCopyWith<$Res> get start {
  
  return $GoogleEventDateTimeCopyWith<$Res>(_self.start, (value) {
    return _then(_self.copyWith(start: value));
  });
}
}


/// @nodoc
mixin _$GoogleEventDateTime {

 String? get date;// если событие целодневное
 String? get dateTime;// если указано конкретное время
 String? get timeZone;
/// Create a copy of GoogleEventDateTime
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GoogleEventDateTimeCopyWith<GoogleEventDateTime> get copyWith => _$GoogleEventDateTimeCopyWithImpl<GoogleEventDateTime>(this as GoogleEventDateTime, _$identity);

  /// Serializes this GoogleEventDateTime to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GoogleEventDateTime&&(identical(other.date, date) || other.date == date)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,dateTime,timeZone);

@override
String toString() {
  return 'GoogleEventDateTime(date: $date, dateTime: $dateTime, timeZone: $timeZone)';
}


}

/// @nodoc
abstract mixin class $GoogleEventDateTimeCopyWith<$Res>  {
  factory $GoogleEventDateTimeCopyWith(GoogleEventDateTime value, $Res Function(GoogleEventDateTime) _then) = _$GoogleEventDateTimeCopyWithImpl;
@useResult
$Res call({
 String? date, String? dateTime, String? timeZone
});




}
/// @nodoc
class _$GoogleEventDateTimeCopyWithImpl<$Res>
    implements $GoogleEventDateTimeCopyWith<$Res> {
  _$GoogleEventDateTimeCopyWithImpl(this._self, this._then);

  final GoogleEventDateTime _self;
  final $Res Function(GoogleEventDateTime) _then;

/// Create a copy of GoogleEventDateTime
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? dateTime = freezed,Object? timeZone = freezed,}) {
  return _then(_self.copyWith(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String?,timeZone: freezed == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GoogleEventDateTime].
extension GoogleEventDateTimePatterns on GoogleEventDateTime {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GoogleEventDateTime value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GoogleEventDateTime() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GoogleEventDateTime value)  $default,){
final _that = this;
switch (_that) {
case _GoogleEventDateTime():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GoogleEventDateTime value)?  $default,){
final _that = this;
switch (_that) {
case _GoogleEventDateTime() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? date,  String? dateTime,  String? timeZone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GoogleEventDateTime() when $default != null:
return $default(_that.date,_that.dateTime,_that.timeZone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? date,  String? dateTime,  String? timeZone)  $default,) {final _that = this;
switch (_that) {
case _GoogleEventDateTime():
return $default(_that.date,_that.dateTime,_that.timeZone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? date,  String? dateTime,  String? timeZone)?  $default,) {final _that = this;
switch (_that) {
case _GoogleEventDateTime() when $default != null:
return $default(_that.date,_that.dateTime,_that.timeZone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GoogleEventDateTime implements GoogleEventDateTime {
  const _GoogleEventDateTime({this.date, this.dateTime, this.timeZone});
  factory _GoogleEventDateTime.fromJson(Map<String, dynamic> json) => _$GoogleEventDateTimeFromJson(json);

@override final  String? date;
// если событие целодневное
@override final  String? dateTime;
// если указано конкретное время
@override final  String? timeZone;

/// Create a copy of GoogleEventDateTime
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GoogleEventDateTimeCopyWith<_GoogleEventDateTime> get copyWith => __$GoogleEventDateTimeCopyWithImpl<_GoogleEventDateTime>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GoogleEventDateTimeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GoogleEventDateTime&&(identical(other.date, date) || other.date == date)&&(identical(other.dateTime, dateTime) || other.dateTime == dateTime)&&(identical(other.timeZone, timeZone) || other.timeZone == timeZone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,dateTime,timeZone);

@override
String toString() {
  return 'GoogleEventDateTime(date: $date, dateTime: $dateTime, timeZone: $timeZone)';
}


}

/// @nodoc
abstract mixin class _$GoogleEventDateTimeCopyWith<$Res> implements $GoogleEventDateTimeCopyWith<$Res> {
  factory _$GoogleEventDateTimeCopyWith(_GoogleEventDateTime value, $Res Function(_GoogleEventDateTime) _then) = __$GoogleEventDateTimeCopyWithImpl;
@override @useResult
$Res call({
 String? date, String? dateTime, String? timeZone
});




}
/// @nodoc
class __$GoogleEventDateTimeCopyWithImpl<$Res>
    implements _$GoogleEventDateTimeCopyWith<$Res> {
  __$GoogleEventDateTimeCopyWithImpl(this._self, this._then);

  final _GoogleEventDateTime _self;
  final $Res Function(_GoogleEventDateTime) _then;

/// Create a copy of GoogleEventDateTime
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? dateTime = freezed,Object? timeZone = freezed,}) {
  return _then(_GoogleEventDateTime(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,dateTime: freezed == dateTime ? _self.dateTime : dateTime // ignore: cast_nullable_to_non_nullable
as String?,timeZone: freezed == timeZone ? _self.timeZone : timeZone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
