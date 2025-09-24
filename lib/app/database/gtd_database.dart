import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:gtd_manager/app/database/database.dart';
import 'package:gtd_manager/app/database/database_interseptor.dart';
import 'package:gtd_manager/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gtd_manager/domain/entities/entities.dart'; // Нужен для Dao
import 'package:path/path.dart' as p;
import 'dart:io';

part 'gtd_database.g.dart';

@DriftDatabase(tables: [Note, Project, Tag, NoteTag, ProjectTag], daos: [NoteDao])
class GtdDatabase extends _$GtdDatabase {
  GtdDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();

      // Создаем триггер после создания таблиц
      await _increaseKeyOrderTrigger();
    },
  );

  Future<void> _increaseKeyOrderTrigger() {
    return customStatement('''
      CREATE TRIGGER IF NOT EXISTS auto_set_key_order 
      AFTER INSERT ON note 
      FOR EACH ROW
      WHEN NEW.key_order = 0
      BEGIN 
        UPDATE note 
        SET key_order = COALESCE((SELECT MAX(key_order) FROM note), 0) + 1
        WHERE id = NEW.id;
      END
    ''');
  }
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await _getDatabasePath();
    final file = File(p.join(dbFolder.path, 'gtd_database.sqlite'));

    // Удаляем базу данных во время разработки
    if (kDebugMode && await file.exists()) {
      await file.delete();
    }

    return NativeDatabase(
      file,
      setup: (db) {
        db.execute('PRAGMA foreign_keys = ON');
        db.execute('PRAGMA cache_size = 10000');
      },
    ).interceptWith(DataBaseInterceptor(talker: talker));
  });
}

Future<Directory> _getDatabasePath() async {
  if (Platform.isAndroid || Platform.isIOS) {
    // Для мобильных устройств
    return getApplicationDocumentsDirectory();
  } else if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    // Для desktop
    return getApplicationSupportDirectory();
  } else {
    // Fallback
    return getApplicationDocumentsDirectory();
  }
}
