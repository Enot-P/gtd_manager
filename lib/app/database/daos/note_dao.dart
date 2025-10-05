import 'dart:async';

import 'package:drift/drift.dart';
import 'package:gtd_manager/app/database/database.dart';
import 'package:gtd_manager/domain/dtos/dtos.dart';
import 'package:gtd_manager/domain/dtos/note_dto/note_update_dto.dart';
import 'package:gtd_manager/domain/entities/entities.dart';

part 'note_dao.g.dart';

@DriftAccessor(tables: [Note])
class NoteDao extends DatabaseAccessor<GtdDatabase> with _$NoteDaoMixin {
  NoteDao(super.db);

  Future<NoteEntity> createNote(NoteDtoCreate note) async {
    return db
        .into(db.note)
        .insertReturning(
          NoteCompanion(
            title: Value(note.title),
            noteCategory: Value(note.noteCategory),
            description: Value.absentIfNull(note.description),
            projectId: Value.absentIfNull(note.projectId),
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
  Future<NoteEntity> updateNote(NoteDtoUpdate newNoteParams) async {
    return (db.update(db.note)..where((e) => e.id.equals(newNoteParams.id)))
        .writeReturning(
          NoteCompanion(
            title: Value.absentIfNull(newNoteParams.title),
            noteCategory: Value.absentIfNull(newNoteParams.noteCategory),
            description: Value.absentIfNull(newNoteParams.description),
            projectId: Value.absentIfNull(newNoteParams.projectId),
            updatedAt: Value.absentIfNull(DateTime.now()),
          ),
        )
        .then((e) => e.first);
  }

  // SQL иньекций лучше избежать и не передавать как строку
  // Используется транзакция, "Все или ничего"
  Future<void> swapKeyOrder({
    required int firstKeyOrder,
    required int secondKeyOrder,
  }) async {
    await db.transaction(() async {
      // Временное значение, которое не существует в таблице
      int tempKey = -1;
      // Обновляем первый ключ на временное значение
      await db.customUpdate(
        'UPDATE note SET key_order = ? WHERE key_order = ?',
        variables: [
          Variable<int>(tempKey),
          Variable<int>(firstKeyOrder),
        ],
      );
      // Обновляем второй ключ на значение первого
      await db.customUpdate(
        'UPDATE note SET key_order = ? WHERE key_order = ?',
        variables: [
          Variable<int>(firstKeyOrder),
          Variable<int>(secondKeyOrder),
        ],
      );
      // Обновляем временное значение на значение второго
      await db.customUpdate(
        'UPDATE note SET key_order = ? WHERE key_order = ?',
        variables: [
          Variable<int>(secondKeyOrder),
          Variable<int>(tempKey),
        ],
      );
    });
  }
}
