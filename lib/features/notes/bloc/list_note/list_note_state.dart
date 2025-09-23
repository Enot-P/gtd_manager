part of 'list_note_bloc.dart';

@immutable
sealed class ListNotesState extends Equatable {}

// Можно и без него
final class ListNotesInitial extends ListNotesState {
  @override
  List<Object?> get props => [];
}

final class ListNotesLoading extends ListNotesState {
  @override
  List<Object?> get props => [];

  List<int> intlist = [22, 4, 2, 1, 4, 5];
}

final class ListNotesLoaded extends ListNotesState {
  final List<NoteEntity> notes;

  ListNotesLoaded(this.notes);

  @override
  List<Object?> get props => [notes];
}

// Скорее всего не надо
final class ListNotesIsEmpty extends ListNotesState {
  @override
  List<Object?> get props => [];
}

final class ListNotesFailure extends ListNotesState {
  final Object? error;

  ListNotesFailure(this.error);

  @override
  List<Object?> get props => [error];
}
