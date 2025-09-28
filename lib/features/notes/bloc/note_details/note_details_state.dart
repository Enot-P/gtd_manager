part of 'note_details_cubit.dart';

@freezed
class NoteDetailsState with _$NoteDetailsState {
  const factory NoteDetailsState.loading() = _NoteDetailsLoading;
  const factory NoteDetailsState.loaded({required NoteEntity note}) = _NoteDetailsLoaded;
  const factory NoteDetailsState.error(String e) = _NoteDetailsError;
}
