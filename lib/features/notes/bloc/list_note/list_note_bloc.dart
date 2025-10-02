import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtd_manager/domain/domain.dart';

part 'list_note_bloc.freezed.dart';
part 'list_note_event.dart';
part 'list_note_state.dart';

class ListNoteBloc extends Bloc<ListNoteEvent, ListNotesState> {
  final NoteRepository noteRepository;

  ListNoteBloc(this.noteRepository) : super(const ListNotesState.loading()) {
    // on<ListNoteEvent>((event, emit) {
    //   event.map(
    //     loadNotes: (event) => _load(event, emit),
    //     createNote: (event) => _createNote(event, emit),
    //     deleteNote: (event) => _deleteNote(event, emit),
    //     changeNotesKeyOrder: (event) => _changeNotesKeyOrder(event, emit),
    //     updateNote: (_UpdateNote value) {},
    //   );
    // });
    on<_LoadNotes>(_load);
    on<_CreateNote>(_createNote);
    on<_DeleteNote>(_deleteNote);
    on<_ChangeNotesKeyOrder>(_changeNotesKeyOrder);
    // on<_MarkNoteDone>(_markNoteDone);
    on<_UpdateNote>(_updateNote);
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
      final note = event.noteEntity;
      if (note.title.trim().isEmpty) {
        throw 'Название заметки не должено быть пустым';
      }
      final newNote = await noteRepository.createNote(event.noteEntity);
      _updateNotesStateUI(emit, (notes) {
        notes.add(newNote);
      });
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
      final notes = event.notes;

      // INFO: Мейби стоит всетаки отдельную DTO сделать?

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

      _updateNotesStateUI(emit, (notes) {
        final temp = notes.removeAt(event.oldIndex);
        notes.insert(event.newIndex, temp);
      });
    } catch (e, st) {
      emit(ListNotesState.failure(error: e, st: st));
    }
  }

  Future<void> _updateNote(_UpdateNote event, Emitter<ListNotesState> emit) async {
    try {
      final updatedNote = await noteRepository.updateNote(noteId: event.noteId, newNoteParams: event.updateParamsNote);
      final updatedNoteId = updatedNote.id;
      if (updatedNoteId == null) {
        const String massage = 'Id заметки отстутвует при пометки задачу сделанной';
        emit(const ListNotesState.failure(error: massage));
        throw massage;
      }
      _updateNotesStateUI(emit, (notes) {
        notes.removeWhere((n) => n.id == updatedNoteId);
      });
    } catch (e, st) {
      emit(ListNotesState.failure(error: e, st: st));
    }
  }

  /// Не обновляет данные в бд! Меняет только отоброжаемые записки.
  /// Используется, чтобы не делать SELECT из бд лишний раз.
  void _updateNotesStateUI(Emitter<ListNotesState> emit, void Function(List<NoteEntity>) updateFunction) {
    final currentState = state;
    if (currentState is _Loaded) {
      final List<NoteEntity> notes = currentState.notes;
      final newListNotes = List<NoteEntity>.from(notes);
      updateFunction(newListNotes);
      emit(ListNotesState.loaded(newListNotes));
    }
  }
}
