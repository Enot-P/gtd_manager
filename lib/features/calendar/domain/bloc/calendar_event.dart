part of 'calendar_bloc.dart';

@freezed
class CalendarEvent with _$CalendarEvent {
  const factory CalendarEvent.loadEvents() = _LoadEvents;

  const factory CalendarEvent.createEvent() = _CreateEvent;

  const factory CalendarEvent.deleteEvent() = _DeleteEvent;
}
