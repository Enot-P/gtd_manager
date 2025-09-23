part of 'list_note_bloc.dart';

@immutable
sealed class ListNoteEvent {}

class LoadNotes extends ListNoteEvent {
  final NoteCategory noteCategory;

  LoadNotes(this.noteCategory);
}

class CreateNote extends ListNoteEvent {
  final NoteEntity noteEntity;
  CreateNote(this.noteEntity);
}

class DeleteNote extends ListNoteEvent {
  final int noteId;
  final NoteCategory noteCategory;

  DeleteNote({
    required this.noteId,
    required this.noteCategory,
  });
}
