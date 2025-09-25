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

  /// Возвращает idRows вставленной в бд
  Future<int> createNote(NoteEntity note) async => noteDao.createNote(note: note);
  Future<void> updateNote({required int noteId, required NoteEntity newNoteParams}) async => noteDao.updateNote(
    noteId: noteId,
    newNoteParams: newNoteParams,
  );

  Future<void> deleteNote(int noteId) async => noteDao.deleteNoteById(noteId);

  Future<void> changeKeyOrderNotes({
    required int firstId,
    required int secondId,
    required int firstKeyOrder,
    required int secondKeyOrder,
  }) async {
    await noteDao.changeKeyOrder(noteId: firstId, newKeyOrder: secondKeyOrder);
    await noteDao.changeKeyOrder(noteId: secondId, newKeyOrder: firstKeyOrder);
  }
}
