part of 'note_bloc.dart';

@immutable
sealed class NoteState {}

final class NoteInitial extends NoteState {}

final class NoteLoading extends NoteState {}

final class NoteLoaded extends NoteState {
  final List<Widget> notes;

  NoteLoaded(this.notes);
}

final class ListNotesIsEmpty extends NoteState {}

final class NoteFailure extends NoteState {
  final Object? error;

  NoteFailure(this.error);
}
