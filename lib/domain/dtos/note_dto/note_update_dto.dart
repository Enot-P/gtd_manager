// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gtd_manager/domain/entities/entities.dart';

/// DTO для обновления новой заметки.
/// Используется при отправке данных в репозиторий или базу.
class NoteDtoUpdate {
  NoteDtoUpdate({
    required this.id,
    this.keyOrder,
    this.title,
    this.noteCategory,
    this.description,
    this.projectId,
  });

  final int id;
  final String? title;
  final NoteCategory? noteCategory;
  final String? description;
  final int? projectId;
  final int? keyOrder;
}
