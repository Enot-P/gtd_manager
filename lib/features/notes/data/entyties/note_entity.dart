import 'package:gtd_manager/app/database/database.dart';

class NoteEntity {
  final int id;
  final String title;
  final NoteCategory category;
  final String description;
  final int projectId;

  NoteEntity({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.projectId,
  });
}
