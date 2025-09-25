import 'dart:async';

import 'package:drift/drift.dart';
import 'package:gtd_manager/app/database/database.dart';
import 'package:gtd_manager/domain/entities/entities.dart';

part 'note_dao.g.dart';

@DriftAccessor(tables: [Note])
class NoteDao extends DatabaseAccessor<GtdDatabase> with _$NoteDaoMixin {
  NoteDao(super.db);

  Future<NoteEntity> createNote({
    required NoteEntity note,
  }) async {
    return db
        .into(db.note)
        .insertReturning(
          NoteCompanion(
            title: Value(note.title),
            noteCategory: Value(note.noteCategory),
            description: Value(note.description),
            projectId: Value(note.projectId),
            createdAt: Value(DateTime.now()),
          ),
        );
  }

  Future<List<NoteEntity>> getAllNotes() => db.select(db.note).get();
  Future<List<NoteEntity>> getNotesByCategory(NoteCategory category) {
    return (db.select(db.note)
          ..where(
            (note) => note.noteCategory.equals(
              note.noteCategory.converter.toSql(category)!,
            ),
          )
          ..orderBy([(e) => OrderingTerm.asc(db.note.keyOrder)]))
        .get();
  }

  Future<NoteEntity> getNoteById(int id) => (db.select(db.note)..where((note) => note.id.equals(id))).getSingle();
  Future<void> deleteNoteById(int id) => (db.delete(db.note)..where((f) => f.id.equals(id))).go();

  /// Возвращает измененную NoteEntity
  Future<NoteEntity> updateNote({
    required NoteEntity newNoteParams,
    required int noteId,
  }) async {
    return (db.update(db.note)..where((e) => e.id.equals(noteId)))
        .writeReturning(
          NoteCompanion(
            title: Value(newNoteParams.title),
            noteCategory: Value(newNoteParams.noteCategory),
            description: newNoteParams.description != null ? Value(newNoteParams.description) : const Value.absent(),
            projectId: newNoteParams.projectId != null ? Value(newNoteParams.projectId) : const Value.absent(),
            updatedAt: Value(DateTime.now()),
          ),
        )
        .then((e) => e.first);
  }

  // SQL иньекций лучше избежать и не передавать как строку
  Future<void> changeKeyOrder({
    required int noteId,
    required int newKeyOrder,
  }) async {
    await db.customUpdate(
      'UPDATE note SET key_order = ? WHERE id = ?',
      variables: [Variable(newKeyOrder), Variable(noteId)],
    );
  }
}
