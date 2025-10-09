import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
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
    note.noteCategory == NoteCategory.backlog
        ? bloc.add(
            ListNoteEvent.deleteNote(note.id),
          )
        : bloc.add(
            ListNoteEvent.changeCategory(note.id, NoteCategory.backlog),
          );
  }

  void _onTapMarkDone(NoteEntity note, ListNoteBloc bloc) {
    bloc.add(
      ListNoteEvent.changeCategory(note.id, NoteCategory.done),
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
          ReorderableDragStartListener(
            index: note.id,
            child: const Icon(Icons.drag_handle),
          ),
        ],
      ),
    );
  }
}
