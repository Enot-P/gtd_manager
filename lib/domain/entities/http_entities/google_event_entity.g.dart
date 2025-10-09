// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_event_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GoogleEventEntity _$GoogleEventEntityFromJson(Map<String, dynamic> json) =>
    _GoogleEventEntity(
      id: json['id'] as String,
      summary: json['summary'] as String,
      description: json['description'] as String?,
      start: GoogleEventDateTime.fromJson(
        json['start'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$GoogleEventEntityToJson(_GoogleEventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'summary': instance.summary,
      'description': instance.description,
      'start': instance.start,
    };

_GoogleEventDateTime _$GoogleEventDateTimeFromJson(Map<String, dynamic> json) =>
    _GoogleEventDateTime(
      date: json['date'] as String?,
      dateTime: json['dateTime'] as String?,
      timeZone: json['timeZone'] as String?,
    );

Map<String, dynamic> _$GoogleEventDateTimeToJson(
  _GoogleEventDateTime instance,
) => <String, dynamic>{
  'date': instance.date,
  'dateTime': instance.dateTime,
  'timeZone': instance.timeZone,
};
