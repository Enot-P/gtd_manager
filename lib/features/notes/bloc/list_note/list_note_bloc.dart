import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtd_manager/domain/domain.dart';

part 'list_note_event.dart';
part 'list_note_state.dart';
part 'list_note_bloc.freezed.dart';

class ListNoteBloc extends Bloc<ListNoteEvent, ListNotesState> {
  final ListNotesRepository noteRepository;

  ListNoteBloc(this.noteRepository) : super(const ListNotesState.loading()) {
    // on<ListNoteEvent>((event, emit) {
    //   event.map(
    //     loadNotes: (_) => _load,
    //     createNote: (_) => _createNote,
    //     deleteNote: (_) => _deleteNote,
    //     changeNotesKeyOrder: (_) => _changeNotesKeyOrder,
    //   );
    // });
    on<_LoadNotes>(_load);
    on<_CreateNote>(_createNote);
    on<_DeleteNote>(_deleteNote);
    on<_ChangeNotesKeyOrder>(_changeNotesKeyOrder);
  }

  Future<void> _load(_LoadNotes event, Emitter<ListNotesState> emit) async {
    try {
      if (state is! _Loaded) {
        emit(const ListNotesState.loading());
        await Future.delayed(const Duration(seconds: 2)); // TODO: убрать в релизе
      }
      final notes = await noteRepository.getNotesByCategory(event.noteCategory);
      emit(ListNotesState.loaded(notes));
    } catch (e, st) {
      emit(ListNotesState.failure(error: e, st: st));
    }
  }

  Future<void> _createNote(_CreateNote event, Emitter<ListNotesState> emit) async {
    try {
      final _controller = TextEditingController();
      bool _validate = false;

      final note = event.noteEntity;
      if (note.title.trim().isNotEmpty) {
        await noteRepository.createNote(event.noteEntity);
      } else {
        throw 'Название заметки не должено быть пустым';
      }
      add(ListNoteEvent.loadNotes(event.noteEntity.noteCategory));
    } catch (e, st) {
      emit(ListNotesState.failure(error: e, st: st));
    }
  }

  Future<void> _deleteNote(_DeleteNote event, Emitter<ListNotesState> emit) async {
    try {
      await noteRepository.deleteNote(event.noteId);
      add(ListNoteEvent.loadNotes(event.noteCategory));
    } catch (e, st) {
      emit(ListNotesState.failure(error: e, st: st));
    }
  }

  Future<void> _changeNotesKeyOrder(_ChangeNotesKeyOrder event, Emitter<ListNotesState> emit) async {
    try {
      final notes = List<NoteEntity>.from(event.notes);
      final temp = notes[event.oldIndex];
      notes[event.oldIndex] = notes[event.newIndex];
      notes[event.newIndex] = temp;

      // WARNING: wtf?

      final firstId = notes[event.oldIndex].id;
      final secondId = notes[event.newIndex].id;
      final firstKeyOrder = notes[event.oldIndex].keyOrder;
      final secondKeyOrder = notes[event.newIndex].keyOrder;

      if (firstId == null || secondId == null || firstKeyOrder == null || secondKeyOrder == null) {
        const errorMassage = 'Перестановка заметок произошла с ошибкой';
        emit(const ListNotesState.failure(error: errorMassage));
        throw errorMassage;
      }

      await noteRepository.changeKeyOrderNotes(
        firstId: firstId,
        secondId: secondId,
        firstKeyOrder: firstKeyOrder,
        secondKeyOrder: secondKeyOrder,
      );

      emit(ListNotesState.loaded(notes));
    } catch (e, st) {
      emit(ListNotesState.failure(error: e, st: st));
    }
  }
}
