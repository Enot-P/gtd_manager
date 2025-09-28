import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/domain/entities/note_entity.dart';
import 'package:gtd_manager/features/notes/bloc/list_note/list_note_bloc.dart';
import 'package:gtd_manager/routing/app_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.note,
  });
  final NoteEntity note;

  void _onTapDelete(NoteEntity note, ListNoteBloc bloc) {
    final noteId = note.id;
    if (noteId == null) throw 'id не должен быть null';

    note.noteCategory == NoteCategory.backlog
        ? bloc.add(
            ListNoteEvent.deleteNote(
              noteId: noteId,
              noteCategory: note.noteCategory,
            ),
          )
        : bloc.add(
            ListNoteEvent.updateNote(
              noteId: noteId,
              updateParamsNote: note.copyWith(noteCategory: NoteCategory.backlog),
            ),
          );
  }

  void _onTapMarkDone(NoteEntity note, ListNoteBloc bloc) {
    final noteId = note.id;
    if (noteId == null) throw 'id не должен быть null';
    bloc.add(
      ListNoteEvent.updateNote(
        noteId: noteId,
        updateParamsNote: note.copyWith(noteCategory: NoteCategory.done),
      ),
    );
  }

  void _onTapFreeSpace(BuildContext context, int noteId) {
    Talker().debug('_onTapFreeSpac был нажат');
    context.router.push(DetailsNoteRoute(noteId: noteId));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ListNoteBloc>();
    final startCheckBoxValue = note.noteCategory == NoteCategory.done ? true : false;
    final noteId = note.id;
    if (noteId == null) throw 'Id не должен быть равен 0';
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _onTapFreeSpace(context, noteId),
      child: Row(
        children: [
          Checkbox(
            value: startCheckBoxValue,
            // Если задача сделана, то ничего не делаем. Возможно стоит возращать ее в список,
            // Где она было до этого, но хз.
            onChanged: (_) => startCheckBoxValue == false ? _onTapMarkDone(note, bloc) : () {},
          ),
          Text(note.title),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () => _onTapDelete(note, bloc),
            icon: const Icon(Icons.delete_outline),
          ),
          note.id != null
              ? ReorderableDragStartListener(
                  index: note.id!,
                  child: const Icon(Icons.drag_handle),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
