import 'package:drift/drift.dart';
import 'package:gtd_manager/app/database/database.dart';

class DatabaseOperations {
  final AppDatabase _db = AppDatabase();

  DatabaseOperations();

  Future<void> createNote({
    required String title,
    required NoteCategory category,
    String? description,
    int? projectId,
  }) async {
    await _db
        .into(_db.note)
        .insert(
          NoteCompanion(
            title: Value(title),
            category: Value(category),
            description: Value(description),
            projectId: Value(projectId),
            createdAt: Value(DateTime.now()),
          ),
        );
  }

  Future<List<NoteData>> getAllNotes() => _db.select(_db.note).get();
  Future<NoteData> getNoteById(int id) => (_db.select(_db.note)..where((note) => note.id.equals(id))).getSingle();
  Future<void> deleteNoteById(int id) => (_db.delete(_db.note)..where((f) => f.id.equals(id))).go();

  Future<void> updateNote({
    required int id,
    required String? title,
    required NoteCategory? category,
    String? description,
    int? projectId,
  }) async {
    await (_db.update(_db.note)..where((note) => note.id.equals(id))).write(
      NoteCompanion(
        title: title != null ? Value(title) : const Value.absent(),
        category: category != null ? Value(category) : const Value.absent(),
        description: description != null ? Value(description) : const Value.absent(),
        projectId: projectId != null ? Value(projectId) : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      ),
    );
  }
}
