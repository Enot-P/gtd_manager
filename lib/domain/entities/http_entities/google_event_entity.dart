import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_event_entity.freezed.dart';
part 'google_event_entity.g.dart';

/// Представляет событие из Google Calendar API.
@freezed
abstract class GoogleEventEntity with _$GoogleEventEntity {
  const factory GoogleEventEntity({
    /// Уникальный ID события
    required String id,

    /// Название события
    required String summary,

    /// Описание события
    String? description,

    /// Список правил повторения (RRULE, EXDATE и т.д.)
    // @Default([]) List<String> recurrence,

    /// Время начала события
    required GoogleEventDateTime start,

    /// Ссылка на событие в веб-версии календаря
    // String? htmlLink,

    /// Статус события ("confirmed", "cancelled", ...)
    // String? status,
  }) = _GoogleEventEntity;

  factory GoogleEventEntity.fromJson(Map<String, dynamic> json) => _$GoogleEventEntityFromJson(json);
}

/// Представляет время начала или окончания события.
/// Может содержать либо `dateTime`, либо `date` (если событие на весь день).
@freezed
abstract class GoogleEventDateTime with _$GoogleEventDateTime {
  const factory GoogleEventDateTime({
    String? date, // если событие целодневное
    String? dateTime, // если указано конкретное время
    String? timeZone, // например "Europe/Warsaw"
  }) = _GoogleEventDateTime;

  factory GoogleEventDateTime.fromJson(Map<String, dynamic> json) => _$GoogleEventDateTimeFromJson(json);
}
