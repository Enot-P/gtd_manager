part of 'list_note_bloc.dart';

@freezed
class ListNoteEvent with _$ListNoteEvent {
  const factory ListNoteEvent.loadNotes(NoteCategory noteCategory) = _LoadNotes;

  const factory ListNoteEvent.createNote(NoteEntity noteEntity) = _CreateNote;

  const factory ListNoteEvent.deleteNote({
    required int noteId,
    required NoteCategory noteCategory,
  }) = _DeleteNote;

  const factory ListNoteEvent.changeNotesKeyOrder({
    required List<NoteEntity> notes,
    required int oldIndex,
    required int newIndex,
  }) = _ChangeNotesKeyOrder;

  const factory ListNoteEvent.markNoteDone(NoteEntity note) = _MarkNoteDone;
}
