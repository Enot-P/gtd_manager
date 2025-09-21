part of 'note_bloc.dart';

@immutable
sealed class NoteEvent {}

class LoadNotes extends NoteEvent {}
