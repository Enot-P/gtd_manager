import 'package:drift/drift.dart';

enum NoteCategory { inbox, waiting, scheduled, someday, next, backlog }

enum ProjectStatus { waiting, inProgress, done }

class Note extends Table with DataControl {
  late final id = integer().autoIncrement()();
  late final title = text().withLength(min: 1, max: 100)();
  late final noteCategory = intEnum<NoteCategory>()();
  late final description = text().nullable()();
  late final projectId = integer().nullable().references(Project, #id)();
}

class Project extends Table with DataControl {
  late final id = integer().autoIncrement()();
  late final title = text().withLength(min: 1, max: 100)();
  late final description = text().nullable()();
  late final status = intEnum<ProjectStatus>()();
  late final parentProjectId = integer().nullable().references(Project, #id)();

  @override
  List<String> get customConstraints => [
    // Не может быть родителем самого себя
    'CHECK (id != parent_project_id)',
  ];
}

class Tag extends Table {
  late final id = integer().autoIncrement()();
  late final title = text().withLength(min: 1, max: 100).unique()();
}

class ProjectTag extends Table {
  late final id = integer().autoIncrement()();
  late final projectId = integer().references(Project, #id)();
  late final tagId = integer().references(Tag, #id)();
}

class NoteTag extends Table {
  late final id = integer().autoIncrement()();
  late final noteId = integer().references(Note, #id)();
  late final tagId = integer().references(Tag, #id)();
}

mixin DataControl on Table {
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
  late final updatedAt = dateTime().nullable()();
}
