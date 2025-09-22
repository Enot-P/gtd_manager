import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:gtd_manager/app/database/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

part 'database_configure.g.dart';

@DriftDatabase(
  tables: [Note, Project, Tag, NoteTag, ProjectTag],
)
class DatabaseConfigure extends _$DatabaseConfigure {
  DatabaseConfigure([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;
}

QueryExecutor _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await _getDatabasePath();
    final file = File(p.join(dbFolder.path, 'gtd_database.sqlite'));

    // Удаляем базу данных во время разработки
    const bool inDevelopment = true; // или используйте kDebugMode
    if (inDevelopment && await file.exists()) {
      await file.delete();
    }

    return NativeDatabase(
      file,
      setup: (db) {
        db.execute('PRAGMA foreign_keys = ON');
        db.execute('PRAGMA cache_size = 10000');
      },
    );
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
