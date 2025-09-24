part of 'list_note_bloc.dart';

@immutable
sealed class ListNotesState extends Equatable {}

final class ListNotesLoading extends ListNotesState {
  @override
  List<Object?> get props => [];
}

final class ListNotesLoaded extends ListNotesState {
  final List<NoteEntity> notes;

  ListNotesLoaded(this.notes);

  @override
  List<Object?> get props => [notes];
}

final class ListNotesFailure extends ListNotesState {
  final Object? error;

  ListNotesFailure(this.error);

  @override
  List<Object?> get props => [error];
}
