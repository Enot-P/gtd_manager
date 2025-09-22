import 'package:gtd_manager/app/database/database.dart';
import 'package:gtd_manager/domain/entities/entities.dart';

class ListNotesRepository {
  final GtdDatabase db;
  late final NoteDao noteDao;
  ListNotesRepository(this.db) {
    noteDao = db.noteDao;
  }

  Future<List<NoteEntity>> getAllNotes() async => noteDao.getAllNotes();

  Future<NoteEntity> getNoteById(int id) async => noteDao.getNoteById(id);

  Future<List<NoteEntity>> getNotesByCategory(NoteCategory noteCategory) async =>
      noteDao.getNotesByCategory(noteCategory);

  Future<void> createNote(NoteEntity note) async {
    await noteDao.createNote(
      title: note.title,
      noteCategory: note.noteCategory,
      description: note.description,
      projectId: note.projectId,
    );
  }

  Future<void> updateNote(int noteId, NoteEntity newParamsNote) async {
    await noteDao.updateNote(
      id: noteId,
      title: newParamsNote.title,
      category: newParamsNote.noteCategory,
      description: newParamsNote.description,
      projectId: newParamsNote.projectId,
    );
  }

  Future<void> deleteNote(int noteId) async {
    await noteDao.deleteNoteById(noteId);
  }
}
