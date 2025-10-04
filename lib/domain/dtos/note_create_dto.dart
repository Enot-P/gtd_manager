import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtd_manager/domain/domain.dart';

part 'note_create_dto.freezed.dart';

@freezed
abstract class NoteCreateDto with _$NoteCreateDto {
  factory NoteCreateDto({
    required String title,
    required NoteCategory noteCategory,
    String? description,
    int? projectId,
  }) = _NoteCreateDto;
}
