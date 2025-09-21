import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:gtd_manager/features/features.dart';
import 'package:gtd_manager/features/notes/data/repositories/notes_repositories.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final noteRepository = NotesRepository();

  NoteBloc() : super(NoteInitial()) {
    on<LoadNotes>((event, emit) async {
      final notes = await noteRepository.getAllNotes();
      final List<Widget> listNotes = List.generate(
        notes.length,
        (int index) => NoteWidget(
          title: notes[index].title,
        ),
        growable: true,
      );

      listNotes.isEmpty ? emit(ListNotesIsEmpty()) : emit(NoteLoaded(listNotes));
    });
  }
}
