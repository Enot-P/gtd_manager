part of 'list_note_bloc.dart';

@freezed
class ListNotesState with _$ListNotesState {
  const factory ListNotesState.loading() = _Loading;
  const factory ListNotesState.loaded(List<NoteEntity> notes) = _Loaded;
  const factory ListNotesState.failure({required Object? error, StackTrace? st}) = _Failure;
}
