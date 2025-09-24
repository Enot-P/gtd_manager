import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_entity.freezed.dart';

enum NoteCategory { inbox, waiting, scheduled, someday, next, backlog }

@freezed
class NoteEntity with _$NoteEntity {
  const NoteEntity({
    this.id,
    required this.title,
    required this.noteCategory,
    this.description,
    this.projectId,
    this.keyOrder,
  });

  @override
  final int? id;

  @override
  final String title;

  @override
  final NoteCategory noteCategory;

  @override
  final String? description;

  @override
  final int? projectId;

  @override
  final int? keyOrder;
}
