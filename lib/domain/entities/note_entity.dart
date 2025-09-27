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
