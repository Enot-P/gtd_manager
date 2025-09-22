part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

class LoadNotes extends NoteEvent {}

class CreateNote extends NoteEvent {
  final NoteEntity noteEntity;
  CreateNote(this.noteEntity);
}

class DeleteNote extends NoteEvent {
  final int noteId;

  DeleteNote({required this.noteId});
}
