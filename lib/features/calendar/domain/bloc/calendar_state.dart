part of 'calendar_bloc.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState.loading() = _Loading;

  const factory CalendarState.loaded() = _Loaded;

  const factory CalendarState.failure() = _Failure;
}
