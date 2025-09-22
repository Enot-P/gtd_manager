part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

class LoadNotes extends NoteEvent {
  final NoteCategory noteCategory;

  LoadNotes(this.noteCategory);
}

class CreateNote extends NoteEvent {
  final NoteEntity noteEntity;
  CreateNote(this.noteEntity);
}

class DeleteNote extends NoteEvent {
  final int noteId;
  final NoteCategory noteCategory;

  DeleteNote({
    required this.noteId,
    required this.noteCategory,
  });
}
