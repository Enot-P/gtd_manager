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
          onChanged: (_) {},
        ),
        Text(note.title),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () => bloc.add(
            DeleteNote(
              noteId: note.id!,
              noteCategory: note.noteCategory,
            ),
          ),
          icon: const Icon(Icons.delete_outline),
        ),
      ],
    );
  }
}
