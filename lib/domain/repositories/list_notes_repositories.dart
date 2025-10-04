import 'package:gtd_manager/app/database/database.dart';
import 'package:gtd_manager/domain/dtos/note_dto/note_dto.dart';
import 'package:gtd_manager/domain/dtos/note_dto/note_update_dto.dart';
import 'package:gtd_manager/domain/entities/entities.dart';

class NoteRepository {
  final GtdDatabase db;
  late final NoteDao noteDao;

  NoteRepository(this.db) {
    noteDao = db.noteDao;
  }

  Future<List<NoteEntity>> getAllNotes() async => noteDao.getAllNotes();

  Future<NoteEntity> getNoteById(int id) async => noteDao.getNoteById(id);

  Future<List<NoteEntity>> getNotesByCategory(NoteCategory noteCategory) async =>
      noteDao.getNotesByCategory(noteCategory);

  /// Возвращает idRows вставленной в бд
  Future<NoteEntity> createNote(NoteDtoCreate note) async => noteDao.createNote(note);

  /// Возвращает обновленую NoteEntity
  Future<NoteEntity> updateNote(NoteDtoUpdate note) async => noteDao.updateNote(note);

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
