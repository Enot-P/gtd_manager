// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_note_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListNoteEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListNoteEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListNoteEvent()';
}


}

/// @nodoc
class $ListNoteEventCopyWith<$Res>  {
$ListNoteEventCopyWith(ListNoteEvent _, $Res Function(ListNoteEvent) __);
}


/// Adds pattern-matching-related methods to [ListNoteEvent].
extension ListNoteEventPatterns on ListNoteEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadNotes value)?  loadNotes,TResult Function( _CreateNote value)?  createNote,TResult Function( _DeleteNote value)?  deleteNote,TResult Function( _ChangeNoteCategory value)?  changeCategory,TResult Function( _ChangeNotesKeyOrder value)?  changeNotesKeyOrder,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadNotes() when loadNotes != null:
return loadNotes(_that);case _CreateNote() when createNote != null:
return createNote(_that);case _DeleteNote() when deleteNote != null:
return deleteNote(_that);case _ChangeNoteCategory() when changeCategory != null:
return changeCategory(_that);case _ChangeNotesKeyOrder() when changeNotesKeyOrder != null:
return changeNotesKeyOrder(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadNotes value)  loadNotes,required TResult Function( _CreateNote value)  createNote,required TResult Function( _DeleteNote value)  deleteNote,required TResult Function( _ChangeNoteCategory value)  changeCategory,required TResult Function( _ChangeNotesKeyOrder value)  changeNotesKeyOrder,}){
final _that = this;
switch (_that) {
case _LoadNotes():
return loadNotes(_that);case _CreateNote():
return createNote(_that);case _DeleteNote():
return deleteNote(_that);case _ChangeNoteCategory():
return changeCategory(_that);case _ChangeNotesKeyOrder():
return changeNotesKeyOrder(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadNotes value)?  loadNotes,TResult? Function( _CreateNote value)?  createNote,TResult? Function( _DeleteNote value)?  deleteNote,TResult? Function( _ChangeNoteCategory value)?  changeCategory,TResult? Function( _ChangeNotesKeyOrder value)?  changeNotesKeyOrder,}){
final _that = this;
switch (_that) {
case _LoadNotes() when loadNotes != null:
return loadNotes(_that);case _CreateNote() when createNote != null:
return createNote(_that);case _DeleteNote() when deleteNote != null:
return deleteNote(_that);case _ChangeNoteCategory() when changeCategory != null:
return changeCategory(_that);case _ChangeNotesKeyOrder() when changeNotesKeyOrder != null:
return changeNotesKeyOrder(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( NoteCategory noteCategory)?  loadNotes,TResult Function( NoteDtoCreate note)?  createNote,TResult Function( int noteId)?  deleteNote,TResult Function( int noteId,  NoteCategory noteCategory)?  changeCategory,TResult Function( int firstKeyOrder,  int secondKeyOrder)?  changeNotesKeyOrder,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadNotes() when loadNotes != null:
return loadNotes(_that.noteCategory);case _CreateNote() when createNote != null:
return createNote(_that.note);case _DeleteNote() when deleteNote != null:
return deleteNote(_that.noteId);case _ChangeNoteCategory() when changeCategory != null:
return changeCategory(_that.noteId,_that.noteCategory);case _ChangeNotesKeyOrder() when changeNotesKeyOrder != null:
return changeNotesKeyOrder(_that.firstKeyOrder,_that.secondKeyOrder);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( NoteCategory noteCategory)  loadNotes,required TResult Function( NoteDtoCreate note)  createNote,required TResult Function( int noteId)  deleteNote,required TResult Function( int noteId,  NoteCategory noteCategory)  changeCategory,required TResult Function( int firstKeyOrder,  int secondKeyOrder)  changeNotesKeyOrder,}) {final _that = this;
switch (_that) {
case _LoadNotes():
return loadNotes(_that.noteCategory);case _CreateNote():
return createNote(_that.note);case _DeleteNote():
return deleteNote(_that.noteId);case _ChangeNoteCategory():
return changeCategory(_that.noteId,_that.noteCategory);case _ChangeNotesKeyOrder():
return changeNotesKeyOrder(_that.firstKeyOrder,_that.secondKeyOrder);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( NoteCategory noteCategory)?  loadNotes,TResult? Function( NoteDtoCreate note)?  createNote,TResult? Function( int noteId)?  deleteNote,TResult? Function( int noteId,  NoteCategory noteCategory)?  changeCategory,TResult? Function( int firstKeyOrder,  int secondKeyOrder)?  changeNotesKeyOrder,}) {final _that = this;
switch (_that) {
case _LoadNotes() when loadNotes != null:
return loadNotes(_that.noteCategory);case _CreateNote() when createNote != null:
return createNote(_that.note);case _DeleteNote() when deleteNote != null:
return deleteNote(_that.noteId);case _ChangeNoteCategory() when changeCategory != null:
return changeCategory(_that.noteId,_that.noteCategory);case _ChangeNotesKeyOrder() when changeNotesKeyOrder != null:
return changeNotesKeyOrder(_that.firstKeyOrder,_that.secondKeyOrder);case _:
  return null;

}
}

}

/// @nodoc


class _LoadNotes implements ListNoteEvent {
  const _LoadNotes(this.noteCategory);
  

 final  NoteCategory noteCategory;

/// Create a copy of ListNoteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadNotesCopyWith<_LoadNotes> get copyWith => __$LoadNotesCopyWithImpl<_LoadNotes>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadNotes&&(identical(other.noteCategory, noteCategory) || other.noteCategory == noteCategory));
}


@override
int get hashCode => Object.hash(runtimeType,noteCategory);

@override
String toString() {
  return 'ListNoteEvent.loadNotes(noteCategory: $noteCategory)';
}


}

/// @nodoc
abstract mixin class _$LoadNotesCopyWith<$Res> implements $ListNoteEventCopyWith<$Res> {
  factory _$LoadNotesCopyWith(_LoadNotes value, $Res Function(_LoadNotes) _then) = __$LoadNotesCopyWithImpl;
@useResult
$Res call({
 NoteCategory noteCategory
});




}
/// @nodoc
class __$LoadNotesCopyWithImpl<$Res>
    implements _$LoadNotesCopyWith<$Res> {
  __$LoadNotesCopyWithImpl(this._self, this._then);

  final _LoadNotes _self;
  final $Res Function(_LoadNotes) _then;

/// Create a copy of ListNoteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? noteCategory = null,}) {
  return _then(_LoadNotes(
null == noteCategory ? _self.noteCategory : noteCategory // ignore: cast_nullable_to_non_nullable
as NoteCategory,
  ));
}


}

/// @nodoc


class _CreateNote implements ListNoteEvent {
  const _CreateNote(this.note);
  

 final  NoteDtoCreate note;

/// Create a copy of ListNoteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateNoteCopyWith<_CreateNote> get copyWith => __$CreateNoteCopyWithImpl<_CreateNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateNote&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'ListNoteEvent.createNote(note: $note)';
}


}

/// @nodoc
abstract mixin class _$CreateNoteCopyWith<$Res> implements $ListNoteEventCopyWith<$Res> {
  factory _$CreateNoteCopyWith(_CreateNote value, $Res Function(_CreateNote) _then) = __$CreateNoteCopyWithImpl;
@useResult
$Res call({
 NoteDtoCreate note
});




}
/// @nodoc
class __$CreateNoteCopyWithImpl<$Res>
    implements _$CreateNoteCopyWith<$Res> {
  __$CreateNoteCopyWithImpl(this._self, this._then);

  final _CreateNote _self;
  final $Res Function(_CreateNote) _then;

/// Create a copy of ListNoteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(_CreateNote(
null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as NoteDtoCreate,
  ));
}


}

/// @nodoc


class _DeleteNote implements ListNoteEvent {
  const _DeleteNote(this.noteId);
  

 final  int noteId;

/// Create a copy of ListNoteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeleteNoteCopyWith<_DeleteNote> get copyWith => __$DeleteNoteCopyWithImpl<_DeleteNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteNote&&(identical(other.noteId, noteId) || other.noteId == noteId));
}


@override
int get hashCode => Object.hash(runtimeType,noteId);

@override
String toString() {
  return 'ListNoteEvent.deleteNote(noteId: $noteId)';
}


}

/// @nodoc
abstract mixin class _$DeleteNoteCopyWith<$Res> implements $ListNoteEventCopyWith<$Res> {
  factory _$DeleteNoteCopyWith(_DeleteNote value, $Res Function(_DeleteNote) _then) = __$DeleteNoteCopyWithImpl;
@useResult
$Res call({
 int noteId
});




}
/// @nodoc
class __$DeleteNoteCopyWithImpl<$Res>
    implements _$DeleteNoteCopyWith<$Res> {
  __$DeleteNoteCopyWithImpl(this._self, this._then);

  final _DeleteNote _self;
  final $Res Function(_DeleteNote) _then;

/// Create a copy of ListNoteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? noteId = null,}) {
  return _then(_DeleteNote(
null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _ChangeNoteCategory implements ListNoteEvent {
  const _ChangeNoteCategory(this.noteId, this.noteCategory);
  

 final  int noteId;
 final  NoteCategory noteCategory;

/// Create a copy of ListNoteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeNoteCategoryCopyWith<_ChangeNoteCategory> get copyWith => __$ChangeNoteCategoryCopyWithImpl<_ChangeNoteCategory>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeNoteCategory&&(identical(other.noteId, noteId) || other.noteId == noteId)&&(identical(other.noteCategory, noteCategory) || other.noteCategory == noteCategory));
}


@override
int get hashCode => Object.hash(runtimeType,noteId,noteCategory);

@override
String toString() {
  return 'ListNoteEvent.changeCategory(noteId: $noteId, noteCategory: $noteCategory)';
}


}

/// @nodoc
abstract mixin class _$ChangeNoteCategoryCopyWith<$Res> implements $ListNoteEventCopyWith<$Res> {
  factory _$ChangeNoteCategoryCopyWith(_ChangeNoteCategory value, $Res Function(_ChangeNoteCategory) _then) = __$ChangeNoteCategoryCopyWithImpl;
@useResult
$Res call({
 int noteId, NoteCategory noteCategory
});




}
/// @nodoc
class __$ChangeNoteCategoryCopyWithImpl<$Res>
    implements _$ChangeNoteCategoryCopyWith<$Res> {
  __$ChangeNoteCategoryCopyWithImpl(this._self, this._then);

  final _ChangeNoteCategory _self;
  final $Res Function(_ChangeNoteCategory) _then;

/// Create a copy of ListNoteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? noteId = null,Object? noteCategory = null,}) {
  return _then(_ChangeNoteCategory(
null == noteId ? _self.noteId : noteId // ignore: cast_nullable_to_non_nullable
as int,null == noteCategory ? _self.noteCategory : noteCategory // ignore: cast_nullable_to_non_nullable
as NoteCategory,
  ));
}


}

/// @nodoc


class _ChangeNotesKeyOrder implements ListNoteEvent {
  const _ChangeNotesKeyOrder({required this.firstKeyOrder, required this.secondKeyOrder});
  

 final  int firstKeyOrder;
 final  int secondKeyOrder;

/// Create a copy of ListNoteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeNotesKeyOrderCopyWith<_ChangeNotesKeyOrder> get copyWith => __$ChangeNotesKeyOrderCopyWithImpl<_ChangeNotesKeyOrder>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeNotesKeyOrder&&(identical(other.firstKeyOrder, firstKeyOrder) || other.firstKeyOrder == firstKeyOrder)&&(identical(other.secondKeyOrder, secondKeyOrder) || other.secondKeyOrder == secondKeyOrder));
}


@override
int get hashCode => Object.hash(runtimeType,firstKeyOrder,secondKeyOrder);

@override
String toString() {
  return 'ListNoteEvent.changeNotesKeyOrder(firstKeyOrder: $firstKeyOrder, secondKeyOrder: $secondKeyOrder)';
}


}

/// @nodoc
abstract mixin class _$ChangeNotesKeyOrderCopyWith<$Res> implements $ListNoteEventCopyWith<$Res> {
  factory _$ChangeNotesKeyOrderCopyWith(_ChangeNotesKeyOrder value, $Res Function(_ChangeNotesKeyOrder) _then) = __$ChangeNotesKeyOrderCopyWithImpl;
@useResult
$Res call({
 int firstKeyOrder, int secondKeyOrder
});




}
/// @nodoc
class __$ChangeNotesKeyOrderCopyWithImpl<$Res>
    implements _$ChangeNotesKeyOrderCopyWith<$Res> {
  __$ChangeNotesKeyOrderCopyWithImpl(this._self, this._then);

  final _ChangeNotesKeyOrder _self;
  final $Res Function(_ChangeNotesKeyOrder) _then;

/// Create a copy of ListNoteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? firstKeyOrder = null,Object? secondKeyOrder = null,}) {
  return _then(_ChangeNotesKeyOrder(
firstKeyOrder: null == firstKeyOrder ? _self.firstKeyOrder : firstKeyOrder // ignore: cast_nullable_to_non_nullable
as int,secondKeyOrder: null == secondKeyOrder ? _self.secondKeyOrder : secondKeyOrder // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$ListNotesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListNotesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListNotesState()';
}


}

/// @nodoc
class $ListNotesStateCopyWith<$Res>  {
$ListNotesStateCopyWith(ListNotesState _, $Res Function(ListNotesState) __);
}


/// Adds pattern-matching-related methods to [ListNotesState].
extension ListNotesStatePatterns on ListNotesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loading value)?  loading,TResult Function( _Loaded value)?  loaded,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loading value)  loading,required TResult Function( _Loaded value)  loaded,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loading value)?  loading,TResult? Function( _Loaded value)?  loaded,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<NoteEntity> notes)?  loaded,TResult Function( Object? error,  StackTrace? st)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.notes);case _Failure() when failure != null:
return failure(_that.error,_that.st);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<NoteEntity> notes)  loaded,required TResult Function( Object? error,  StackTrace? st)  failure,}) {final _that = this;
switch (_that) {
case _Loading():
return loading();case _Loaded():
return loaded(_that.notes);case _Failure():
return failure(_that.error,_that.st);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<NoteEntity> notes)?  loaded,TResult? Function( Object? error,  StackTrace? st)?  failure,}) {final _that = this;
switch (_that) {
case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.notes);case _Failure() when failure != null:
return failure(_that.error,_that.st);case _:
  return null;

}
}

}

/// @nodoc


class _Loading implements ListNotesState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListNotesState.loading()';
}


}




/// @nodoc


class _Loaded implements ListNotesState {
  const _Loaded(final  List<NoteEntity> notes): _notes = notes;
  

 final  List<NoteEntity> _notes;
 List<NoteEntity> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}


/// Create a copy of ListNotesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._notes, _notes));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notes));

@override
String toString() {
  return 'ListNotesState.loaded(notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ListNotesStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<NoteEntity> notes
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ListNotesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? notes = null,}) {
  return _then(_Loaded(
null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<NoteEntity>,
  ));
}


}

/// @nodoc


class _Failure implements ListNotesState {
  const _Failure({required this.error, this.st});
  

 final  Object? error;
 final  StackTrace? st;

/// Create a copy of ListNotesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&const DeepCollectionEquality().equals(other.error, error)&&(identical(other.st, st) || other.st == st));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error),st);

@override
String toString() {
  return 'ListNotesState.failure(error: $error, st: $st)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $ListNotesStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 Object? error, StackTrace? st
});




}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of ListNotesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,Object? st = freezed,}) {
  return _then(_Failure(
error: freezed == error ? _self.error : error ,st: freezed == st ? _self.st : st // ignore: cast_nullable_to_non_nullable
as StackTrace?,
  ));
}


}

// dart format on
