import 'package:gtd_manager/domain/entities/entities.dart';

/// DTO для создания новой заметки.
/// Используется при отправке данных в репозиторий или базу.
class NoteDtoCreate {
  final String title;
  final NoteCategory noteCategory;
  final String? description;
  final int? projectId;

  const NoteDtoCreate({
    required this.title,
    required this.noteCategory,
    this.description,
    this.projectId,
  });
}
