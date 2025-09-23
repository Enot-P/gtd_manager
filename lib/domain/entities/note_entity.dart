import 'package:equatable/equatable.dart';

enum NoteCategory { inbox, waiting, scheduled, someday, next, backlog }

// WARNING: Нужно ли делать id обязательным?
class NoteEntity extends Equatable {
  final int? id;
  final String title;
  final NoteCategory noteCategory;
  final String? description;
  final int? projectId;

  const NoteEntity({
    this.id,
    required this.title,
    required this.noteCategory,
    this.description,
    this.projectId,
  });

  @override
  List<Object?> get props => [id, title, noteCategory, description, projectId];

  @override
  bool? get stringify => true;

  // Frezed
  NoteEntity copyWith({
    int? id,
    String? title,
    NoteCategory? noteCategory,
    String? description,
    int? projectId,
  }) {
    return NoteEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      noteCategory: noteCategory ?? this.noteCategory,
      description: description ?? this.description,
      projectId: projectId ?? this.projectId,
    );
  }
}
