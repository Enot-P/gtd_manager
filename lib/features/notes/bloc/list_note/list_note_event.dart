part of 'list_note_bloc.dart';

@freezed
class ListNoteEvent with _$ListNoteEvent {
  const factory ListNoteEvent.loadNotes(NoteCategory noteCategory) = _LoadNotes;

  const factory ListNoteEvent.createNote(NoteDtoCreate note) = _CreateNote;

  const factory ListNoteEvent.deleteNote(int noteId) = _DeleteNote;

  const factory ListNoteEvent.updateNote(NoteDtoUpdate updateParamsNote) = _UpdateNote;

  const factory ListNoteEvent.changeNotesKeyOrder({
    required List<NoteEntity> notes,
    required int oldIndex,
    required int newIndex,
  }) = _ChangeNotesKeyOrder;
}
