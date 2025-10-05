import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtd_manager/domain/dtos/dtos.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
import 'package:gtd_manager/domain/repositories/repositories.dart';
import 'package:gtd_manager/main.dart';

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
    on<_ChangeNoteCategory>(_updateNoteCategory);
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
      _updateNotesStateUI(emit, (notes) {
        notes.removeWhere((e) => e.id == event.noteId);
      });
    } catch (e, st) {
      emit(ListNotesState.failure(error: e, st: st));
    }
  }

  Future<void> _changeNotesKeyOrder(_ChangeNotesKeyOrder event, Emitter<ListNotesState> emit) async {
    try {
      await noteRepository.changeKeyOrderNotes(
        firstKeyOrder: event.firstKeyOrder,
        secondKeyOrder: event.secondKeyOrder,
      );

      _updateNotesStateUI(emit, (notes) {
        final firstIndex = notes.indexWhere((note) => note.keyOrder == event.firstKeyOrder);
        final secondIndex = notes.indexWhere((note) => note.keyOrder == event.secondKeyOrder);
        // Проверяем, что оба элемента найдены
        if (firstIndex == -1 || secondIndex == -1) {
          throw Exception('Не удалось найти элементы для обмена порядка');
        }
        final firstNote = notes[firstIndex].copyWith(keyOrder: event.secondKeyOrder);
        final secondNote = notes[secondIndex].copyWith(keyOrder: event.firstKeyOrder);
        notes[firstIndex] = secondNote;
        notes[secondIndex] = firstNote;
      });
    } catch (e, st) {
      emit(ListNotesState.failure(error: e, st: st));
    }
  }

  Future<void> _updateNoteCategory(_ChangeNoteCategory event, Emitter<ListNotesState> emit) async {
    try {
      // ? Что должно обновляться первее, бд или визуал?
      _updateNotesStateUI(emit, (notes) {
        // если Категория точно такая же, то не меняем ничего
        if (notes.firstWhere((e) => e.id == event.noteId).noteCategory == event.noteCategory) return;
        notes.removeWhere((e) => e.id == event.noteId);
      });
      await noteRepository.updateNote(
        NoteDtoUpdate(
          id: event.noteId,
          noteCategory: event.noteCategory,
        ),
      );
    } catch (e, st) {
      emit(ListNotesState.failure(error: e, st: st));
    }
  }

  /// Не обновляет данные в бд! Меняет только отоброжаемые записки.
  /// Используется, чтобы не делать SELECT из бд лишний раз.
  void _updateNotesStateUI(Emitter<ListNotesState> emit, void Function(List<NoteEntity>) updateFunction) {
    try {
      final currentState = state;
      if (currentState is _Loaded) {
        final List<NoteEntity> notes = currentState.notes;
        final newListNotes = List<NoteEntity>.from(notes);
        updateFunction(newListNotes);
        emit(ListNotesState.loaded(newListNotes));
      }
    } catch (e, st) {
      emit(const ListNotesState.failure(error: 'Ошибка при обновлении UI'));
      talker.handle(e, st);
    }
  }
}
