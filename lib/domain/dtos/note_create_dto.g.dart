// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_create_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoteCreateDto _$NoteCreateDtoFromJson(Map<String, dynamic> json) =>
    _NoteCreateDto(
      title: json['title'] as String,
      noteCategory: $enumDecode(_$NoteCategoryEnumMap, json['noteCategory']),
      description: json['description'] as String?,
      projectId: (json['projectId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NoteCreateDtoToJson(_NoteCreateDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'noteCategory': _$NoteCategoryEnumMap[instance.noteCategory]!,
      'description': instance.description,
      'projectId': instance.projectId,
    };

const _$NoteCategoryEnumMap = {
  NoteCategory.inbox: 'inbox',
  NoteCategory.waiting: 'waiting',
  NoteCategory.scheduled: 'scheduled',
  NoteCategory.someday: 'someday',
  NoteCategory.next: 'next',
  NoteCategory.backlog: 'backlog',
  NoteCategory.done: 'done',
};
