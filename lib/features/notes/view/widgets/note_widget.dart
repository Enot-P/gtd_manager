import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/domain/entities/note_entity.dart';
import 'package:gtd_manager/features/notes/bloc/list_note/list_note_bloc.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.note,
  });
  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ListNoteBloc>();
    return Row(
      children: [
        Checkbox(
          value: false,
          onChanged: (_) => bloc.add(ListNoteEvent.markNoteDone(note)),
        ),
        Text(note.title),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () => bloc.add(
            ListNoteEvent.deleteNote(
              noteId: note.id!,
              noteCategory: note.noteCategory,
            ),
          ),
          icon: const Icon(Icons.delete_outline),
        ),
        note.id != null
            ? ReorderableDragStartListener(
                index: note.id!,
                child: const Icon(Icons.drag_handle),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
