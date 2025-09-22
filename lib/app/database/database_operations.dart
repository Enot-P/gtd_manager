import 'package:drift/drift.dart';
import 'package:gtd_manager/app/database/database.dart';

class DatabaseOperations {
  final DatabaseConfigure db;

  DatabaseOperations(this.db);

  Future<void> createNote({
    required String title,
    required NoteCategory noteCategory,
    String? description,
    int? projectId,
  }) async {
    await db
        .into(db.note)
        .insert(
          NoteCompanion(
            title: Value(title),
            noteCategory: Value(noteCategory),
            description: Value(description),
            projectId: Value(projectId),
            createdAt: Value(DateTime.now()),
          ),
        );
  }

  Future<List<NoteData>> getAllNotes() => db.select(db.note).get();
  Future<List<NoteData>> getNotesByCategory(NoteCategory category) {
    return (db.select(db.note)..where(
          (note) => note.noteCategory.equals(
            note.noteCategory.converter.toSql(category)!,
          ),
        ))
        .get();
  }

  Future<NoteData> getNoteById(int id) => (db.select(db.note)..where((note) => note.id.equals(id))).getSingle();
  Future<void> deleteNoteById(int id) => (db.delete(db.note)..where((f) => f.id.equals(id))).go();

  Future<void> updateNote({
    required int id,
    required String? title,
    required NoteCategory? category,
    String? description,
    int? projectId,
  }) async {
    await (db.update(db.note)..where((note) => note.id.equals(id))).write(
      NoteCompanion(
        title: title != null ? Value(title) : const Value.absent(),
        noteCategory: category != null ? Value(category) : const Value.absent(),
        description: description != null ? Value(description) : const Value.absent(),
        projectId: projectId != null ? Value(projectId) : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
