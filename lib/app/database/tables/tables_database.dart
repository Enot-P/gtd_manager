import 'package:drift/drift.dart';
import 'package:gtd_manager/domain/domain.dart';

/// Параметр keyOrder - используется для ReorderList. т.е. для обозначения в каком порядке отображать
/// Обновляется через триггер: (Каждый раз, когда новое значение keyOrder = 0,
/// keyOrder присваивается значение текущего максимального + 1)
@UseRowClass(NoteEntity)
class Note extends Table with DataControl {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  IntColumn get noteCategory => intEnum<NoteCategory>()();
  TextColumn get description => text().nullable()();
  IntColumn get projectId => integer().nullable().references(Project, #id, onDelete: KeyAction.cascade)();
  IntColumn get keyOrder => integer().withDefault(const Constant(0))();
}

@UseRowClass(ProjectEntity)
class Project extends Table with DataControl {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  IntColumn get projectStatus => intEnum<ProjectStatus>()();
  IntColumn get keyOrder => integer().generatedAs(id, stored: true)();
  IntColumn get parentProjectId => integer().nullable().references(Project, #id, onDelete: KeyAction.cascade)();

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
  IntColumn get projectId => integer().references(Project, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId => integer().references(Tag, #id, onDelete: KeyAction.cascade)();
}

@UseRowClass(NoteTagEntity)
class NoteTag extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get noteId => integer().references(Note, #id, onDelete: KeyAction.cascade)();
  IntColumn get tagId => integer().references(Tag, #id, onDelete: KeyAction.cascade)();
}

mixin DataControl on Table {
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
}
