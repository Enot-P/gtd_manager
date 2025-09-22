import 'package:drift/drift.dart';
import 'package:gtd_manager/domain/domain.dart';

@UseRowClass(NoteEntity)
class Note extends Table with DataControl {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  IntColumn get noteCategory => intEnum<NoteCategory>()();
  TextColumn get description => text().nullable()();
  IntColumn get projectId => integer().nullable().references(Project, #id)();
}

@UseRowClass(ProjectEntity)
class Project extends Table with DataControl {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  IntColumn get projectStatus => intEnum<ProjectStatus>()();
  IntColumn get parentProjectId => integer().nullable().references(Project, #id)();

  @override
  List<String> get customConstraints => [
    // Не может быть родителем самого себя
    'CHECK (id != parent_project_id)',
  ];
}

@UseRowClass(TagEntity)
class Tag extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100).unique()();
}

@UseRowClass(ProjectTagEntity)
class ProjectTag extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get projectId => integer().references(Project, #id)();
  IntColumn get tagId => integer().references(Tag, #id)();
}

@UseRowClass(NoteTagEntity)
class NoteTag extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get noteId => integer().references(Note, #id)();
  IntColumn get tagId => integer().references(Tag, #id)();
}

mixin DataControl on Table {
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
