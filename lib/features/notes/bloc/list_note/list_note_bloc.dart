import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:gtd_manager/domain/domain.dart';
import 'package:gtd_manager/features/features.dart';

part 'list_note_event.dart';
part 'list_note_state.dart';

class ListNoteBloc extends Bloc<ListNoteEvent, ListNotesState> {
  final ListNotesRepository noteRepository;

  ListNoteBloc(this.noteRepository) : super(ListNotesInitial()) {
    on<LoadNotes>(_load);
    on<CreateNote>(_createNote);
    on<DeleteNote>(_deleteNote);
  }

  Future<void> _load(LoadNotes event, Emitter<ListNotesState> emit) async {
    try {
      if (state is! ListNotesLoaded) {
        emit(ListNotesLoading());
        // TODO: Убрать задержку надо в релизе
        await Future.delayed(const Duration(seconds: 2));
      }

      final notes = await noteRepository.getNotesByCategory(event.noteCategory);
      final List<Widget> listNotes = List.generate(
        notes.length,
        (int index) => NoteWidget(
          key: Key('$index'),
          note: notes[index],
        ),
      );
      listNotes.isEmpty ? emit(ListNotesIsEmpty()) : emit(ListNotesLoaded(listNotes));
    } catch (e) {
      emit(ListNotesFailure(e));
    }
  }

  FutureOr<void> _createNote(CreateNote event, Emitter<ListNotesState> emit) async {
    try {
      await noteRepository.createNote(event.noteEntity);
      add(LoadNotes(event.noteEntity.noteCategory));
    } catch (e) {
      emit(ListNotesFailure(e));
    }
  }

  FutureOr<void> _deleteNote(DeleteNote event, Emitter<ListNotesState> emit) async {
    try {
      await noteRepository.deleteNote(event.noteId);
      add(LoadNotes(event.noteCategory));
    } catch (e) {
      emit(ListNotesFailure(e));
    }
  }
}
