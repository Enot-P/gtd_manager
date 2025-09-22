import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:gtd_manager/features/features.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, ListNotesState> {
  final noteRepository;

  NoteBloc(this.noteRepository) : super(ListNotesInitial()) {
    on<LoadNotes>((event, emit) async {
      try {
        if (state is! ListNotesLoaded) emit(ListNotesLoading());

        // TODO: Убрать задержку надо в релизе
        await Future.delayed(const Duration(seconds: 2));

        final notes = await noteRepository.getAllNotes();
        final List<Widget> listNotes = List.generate(
          notes.length,
          (int index) => NoteWidget(
            title: notes[index].title,
          ),
          growable: true,
        );
        listNotes.isEmpty ? emit(ListNotesIsEmpty()) : emit(ListNotesLoaded(listNotes));
      } catch (e) {
        emit(ListNotesFailure(e));
      }
    });
  }
}
