import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtd_manager/domain/dtos/dtos.dart';
import 'package:gtd_manager/domain/dtos/note_dto/note_update_dto.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
import 'package:gtd_manager/domain/repositories/repositories.dart';

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
      final note = event.note;

      // ? Нужен ли UseCase?
      if (note.title.trim().isEmpty) {
        throw 'Название заметки не должено быть пустым';
      }

      final newNote = await noteRepository.createNote(note);
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
      // add(ListNoteEvent.loadNotes(event.noteCategory));
      _updateNotesStateUI(emit, (notes) {
        notes.removeAt(event.noteId);
      });
    } catch (e, st) {
      emit(ListNotesState.failure(error: e, st: st));
    }
  }

  Future<void> _changeNotesKeyOrder(_ChangeNotesKeyOrder event, Emitter<ListNotesState> emit) async {
    try {
      final notes = event.notes;

      await noteRepository.changeKeyOrderNotes(
        firstId: notes.first.id,
        secondId: notes.last.id,
        firstKeyOrder: notes.first.keyOrder,
        secondKeyOrder: notes.last.keyOrder,
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
      final noteParams = event.updateParamsNote;
      final updatedNote = await noteRepository.updateNote(noteParams);
      _updateNotesStateUI(emit, (notes) {
        notes.removeWhere((n) => n.id == updatedNote.id);
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
