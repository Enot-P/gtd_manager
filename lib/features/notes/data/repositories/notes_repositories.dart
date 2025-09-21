import 'package:gtd_manager/app/database/database.dart';
import 'package:gtd_manager/features/notes/data/entyties/note_entity.dart';

class NotesRepository {
  final dbOperations = DatabaseOperations();

  Future<List<NoteData>> getAllNotes() async => dbOperations.getAllNotes();

  Future<void> createNote(NoteEntity note) async {
    await dbOperations.createNote(
      title: note.title,
      category: note.category,
      description: note.description,
      projectId: note.projectId,
    );
  }

  Future<void> updateNote(NoteEntity note) async {
    await dbOperations.updateNote(
      id: note.id,
      title: note.title,
      category: note.category,
      description: note.description,
      projectId: note.projectId,
    );
  }

  Future<void> deleteNote(NoteEntity note) async {
    await dbOperations.deleteNoteById(note.id);
  }
}
