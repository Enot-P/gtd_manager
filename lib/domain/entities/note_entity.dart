import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'note_entity.freezed.dart';

enum NoteCategory { inbox, waiting, scheduled, someday, next, backlog, done }

extension NoteCategoryExtension on NoteCategory {
  String get getCategory {
    switch (this) {
      case NoteCategory.inbox:
        return 'Входящие задачи';
      case NoteCategory.next:
        return 'Текущие задачи';
      case NoteCategory.waiting:
        return 'Ожидание';
      case NoteCategory.scheduled:
        return 'Запланировано';
      case NoteCategory.someday:
        return 'Когда-нибудь';
      case NoteCategory.backlog:
        return 'Корзина';
      case NoteCategory.done:
        return 'Выполненные задачи';
    }
  }

  IconData get getIcon {
    switch (this) {
      case NoteCategory.inbox:
        return Icons.inbox;
      case NoteCategory.next:
        return Icons.next_plan;
      case NoteCategory.waiting:
        return Icons.access_time;
      case NoteCategory.scheduled:
        return Icons.calendar_today;
      case NoteCategory.someday:
        return Icons.star;
      case NoteCategory.backlog:
        return Icons.list;
      case NoteCategory.done:
        return Icons.check_circle;
    }
  }
}

@freezed
abstract class NoteEntity with _$NoteEntity {
  const factory NoteEntity({
    required int id,
    required String title,
    required NoteCategory noteCategory,
    String? description,
    int? projectId,
    required int keyOrder,
  }) = _NoteEntity;

  // factory NoteEntity.create({
  //   required String title,
  //   required NoteCategory noteCategory,
  //   String? description,
  //   int? projectId,
  // }) = _NoteEntity;
}
