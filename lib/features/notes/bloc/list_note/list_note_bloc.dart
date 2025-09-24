import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:gtd_manager/domain/domain.dart';

part 'list_note_event.dart';
part 'list_note_state.dart';

class ListNoteBloc extends Bloc<ListNoteEvent, ListNotesState> {
  final ListNotesRepository noteRepository;

  ListNoteBloc(this.noteRepository) : super(ListNotesLoading()) {
    on<LoadNotes>(_load);
    on<CreateNote>(_createNote);
    on<DeleteNote>(_deleteNote);
    on<ChangeNotesKeyOrder>(_changeNotesKeyOrder);
  }

  Future<void> _load(LoadNotes event, Emitter<ListNotesState> emit) async {
    try {
      if (state is! ListNotesLoaded) {
        emit(ListNotesLoading());
        await Future.delayed(const Duration(seconds: 2)); // TODO: Убрать задержку надо в релизе
      }
      final notes = await noteRepository.getNotesByCategory(event.noteCategory);
      emit(ListNotesLoaded(notes));
    } catch (e) {
      emit(ListNotesFailure(e));
    }
  }

  Future<void> _createNote(CreateNote event, Emitter<ListNotesState> emit) async {
    try {
      await noteRepository.createNote(event.noteEntity);
      add(LoadNotes(event.noteEntity.noteCategory));
    } catch (e) {
      emit(ListNotesFailure(e));
    }
  }

  Future<void> _deleteNote(DeleteNote event, Emitter<ListNotesState> emit) async {
    try {
      await noteRepository.deleteNote(event.noteId);
      add(LoadNotes(event.noteCategory));
    } catch (e) {
      emit(ListNotesFailure(e));
    }
  }

  Future<void> _changeNotesKeyOrder(ChangeNotesKeyOrder event, Emitter<ListNotesState> emit) async {
    try {
      final notes = event.notes;
      final temp = notes[event.oldIndex];
      notes[event.oldIndex] = notes[event.newIndex];
      notes[event.newIndex] = temp;

      final firstId = notes[event.oldIndex].id;
      final secondId = notes[event.newIndex].id;
      final firstKeyOrder = notes[event.oldIndex].keyOrder;
      final secondKeyOrder = notes[event.newIndex].keyOrder;

      if (firstId == null || secondId == null || firstKeyOrder == null || secondKeyOrder == null) {
        const errorMassage = 'Перестановка заметок произошла с ошибкой';
        emit(ListNotesFailure(errorMassage));
        throw 'errorMassage';
      }

      await noteRepository.changeKeyOrderNotes(
        firstId: firstId,
        secondId: secondId,
        firstKeyOrder: firstKeyOrder,
        secondKeyOrder: secondKeyOrder,
      );
      // INFO: Херня варик, не?)
      // add(LoadNotes(event.noteCategory));
      emit(ListNotesLoaded(notes));
    } catch (e) {
      emit(ListNotesFailure(e));
    }
  }
}
