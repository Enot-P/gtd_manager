import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
import 'package:gtd_manager/domain/repositories/repositories.dart';

part 'note_details_state.dart';
part 'note_details_cubit.freezed.dart';

class NoteDetailsCubit extends Cubit<NoteDetailsState> {
  final NoteRepository noteRepo;
  NoteDetailsCubit(this.noteRepo) : super(const NoteDetailsState.loading());

  Future<NoteEntity> getNoteById(int noteId) async {
    final note = await noteRepo.getNoteById(noteId);
    await Future.delayed(const Duration(seconds: 2));
    emit(NoteDetailsState.loaded(note: note));
    return note;
  }
}
