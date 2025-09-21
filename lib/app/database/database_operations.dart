import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:gtd_manager/app/database/database.dart';

class DatabaseOperations {
  final AppDatabase _db;

  DatabaseOperations(this._db);
  Future<void> createNote({
    required String title,
    required Category category,
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
}
