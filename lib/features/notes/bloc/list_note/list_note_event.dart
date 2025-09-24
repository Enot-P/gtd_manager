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

class ChangeNotesKeyOrder extends ListNoteEvent {
  // final int firstId;
  // final int secondId;
  // final int firstKeyOrder;
  // final int secondKeyOrder;
  // final NoteCategory noteCategory;
  final List<NoteEntity> notes;
  final int oldIndex;
  final int newIndex;

  ChangeNotesKeyOrder({
    required this.notes,
    required this.oldIndex,
    required this.newIndex,
    // required this.noteCategory,
    // required this.firstId,
    // required this.secondId,
    // required this.firstKeyOrder,
    // required this.secondKeyOrder,
  });
}
