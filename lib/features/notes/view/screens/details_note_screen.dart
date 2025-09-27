import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
import 'package:gtd_manager/features/notes/bloc/note_details/note_details_cubit.dart';

@RoutePage()
class DetailsNoteScreen extends StatelessWidget {
  const DetailsNoteScreen({super.key, required this.noteId});
  final int noteId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Изменить задачу'),
      ),
      body: BlocBuilder<NoteDetailsCubit, NoteDetailsState>(
        builder: (context, state) {
          return state.when(
            loaded: (note) => _NoteDetailsWidget(note: note),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (String message) => Center(child: Text(message)),
          );
        },
      ),
    );
  }
}

class _NoteDetailsWidget extends StatelessWidget {
  const _NoteDetailsWidget({
    required this.note,
  });

  final NoteEntity note;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: note.title);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        spacing: 10,
        children: [
          TextField(
            decoration: const InputDecoration.collapsed(hintText: 'Название'),
            controller: titleController,
          ),
          _NoteProjectAndCategoryWidget(
            noteCategory: note.noteCategory,
            project: note.projectId,
          ),

          const _NoteTagsWidget(),
        ],
      ),
    );
  }
}

class _NoteProjectAndCategoryWidget extends StatelessWidget {
  const _NoteProjectAndCategoryWidget({
    required this.noteCategory,
    required this.project,
  });
  final NoteCategory noteCategory;
  final int? project;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // TODO: Должно открывать модальное окно для выбора категории
      onTap: () => showMenu(
        context: context,
        items: [const PopupMenuItem(child: Text('taa'))],
      ),
      child: Row(
        children: [
          Icon(noteCategory.getIcon),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(noteCategory.getCategory),
              project != null
                  ? Text(project.toString())
                  : const Text(
                      'Без проекта',
                      style: TextStyle(color: Colors.black54),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NoteTagsWidget extends StatelessWidget {
  const _NoteTagsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 10,
      children: [
        _NoteTagWidget(text: 'Тег1'),
        _NoteTagWidget(text: 'Тег2'),
        _NoteTagWidget(text: 'Тег3'),
      ],
    );
  }
}

class _NoteTagWidget extends StatelessWidget {
  const _NoteTagWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        '#$text',
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
