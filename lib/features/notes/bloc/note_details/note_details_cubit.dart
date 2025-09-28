import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
import 'package:gtd_manager/domain/repositories/repositories.dart';

part 'note_details_state.dart';
part 'note_details_cubit.freezed.dart';

class NoteDetailsCubit extends Cubit<NoteDetailsState> {
  final NoteRepository noteRepo;
  late final NoteEntity note;

  final descriptionController = QuillController.basic();
  final titleController = TextEditingController();

  NoteDetailsCubit(this.noteRepo, int noteId) : super(const NoteDetailsState.loading()) {
    _loadNote(noteId);
  }
  Future<NoteEntity?> _loadNote(int noteId) async {
    try {
      note = await noteRepo.getNoteById(noteId);
      titleController.text = note.title;
      if (note.description?.isNotEmpty == true) {
        try {
          final deltaJson = jsonDecode(note.description!);
          descriptionController.document = Document.fromJson(deltaJson);
        } catch (e) {
          descriptionController.document.insert(0, note.description!);
        }
      }
      await Future.delayed(const Duration(seconds: 2));
      emit(NoteDetailsState.loaded(note: note));
      return note;
    } catch (e) {
      emit(const NoteDetailsState.error('При загрузке задачи произошла ошибка'));
      return null;
    }
  }

  Future<void> saveNote() async {
    try {
      final noteId = note.id;
      if (noteId == null) {
        throw 'Id не должен быть равен null';
      }
      final deltaJson = jsonEncode(descriptionController.document.toDelta().toJson());
      final newNote = NoteEntity(
        title: titleController.text,
        noteCategory: note.noteCategory,
        description: deltaJson,
      );
      await noteRepo.updateNote(
        noteId: noteId,
        newNoteParams: newNote,
      );
    } catch (e) {
      emit(const NoteDetailsState.error('При сохранении задачи произошла ошибка'));
    }
  }
}
