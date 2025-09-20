import 'package:drift/drift.dart';

enum Category { inbox, waiting, scheduled, someday, next, backlog }

class Note extends Table with DataControl {
  late final id = integer().autoIncrement()();
  late final title = text().withLength(min: 1, max: 100)();
  late final category = textEnum<Category>()();
  late final description = text().nullable()();
  late final projectId = integer().nullable().references(Project, #id)();
}

class Project extends Table with DataControl {
  late final id = integer().autoIncrement()();
  late final title = text().withLength(min: 1, max: 100)();
  late final description = text().nullable()();
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

class TagLinks extends Table {
  late final id = integer().autoIncrement()();
  late final projectId = integer().nullable().references(Project, #id)();
  late final noteId = integer().nullable().references(Note, #id)();
  late final tagId = integer().references(Tag, #id)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {projectId, tagId},
    {noteId, tagId},
  ];

  @override
  List<String> get customConstraints => [
    // Должна быть связь либо с проектом, либо с заметкой
    'CHECK ((project_id IS NOT NULL AND note_id IS NULL) OR (project_id IS NULL AND note_id IS NOT NULL))',
  ];
}

mixin DataControl on Table {
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
  late final updatedAt = dateTime().nullable()();
}
