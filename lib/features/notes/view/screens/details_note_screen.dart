import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
import 'package:gtd_manager/domain/repositories/list_notes_repositories.dart';
import 'package:gtd_manager/features/notes/bloc/bloc.dart';
import 'package:gtd_manager/features/notes/bloc/note_details/note_details_cubit.dart';
import 'package:gtd_manager/main.dart';
import 'package:select_dialog/select_dialog.dart';

@RoutePage()
class DetailsNoteScreen extends StatelessWidget {
  const DetailsNoteScreen({super.key, required this.noteId});
  final int noteId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NoteDetailsCubit(context.read<NoteRepository>(), noteId),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Изменить задачу'),
        ),
        body: BlocBuilder<NoteDetailsCubit, NoteDetailsState>(
          builder: (context, state) {
            return PopScope(
              canPop: false,
              onPopInvokedWithResult: (bool didPop, dynamic result) async {
                if (didPop) {
                  return;
                }
                await _updateNote(context);
              },
              child: state.when(
                loaded: (note) => SingleChildScrollView(child: _NoteDetailsWidget(note: note)),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (String message) => Center(child: Text(message)),
              ),
            );
          },
        ),
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
    final titleController = context.read<NoteDetailsCubit>().titleController;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        spacing: 10,
        children: [
          TextField(
            decoration: const InputDecoration.collapsed(hintText: 'Название'),
            controller: titleController,
          ),
          const _NoteProjectAndCategoryWidget(),
          const _NoteTagsWidget(),
          const _NoteDescriptionWidget(),
        ],
      ),
    );
  }
}

class _NoteProjectAndCategoryWidget extends StatefulWidget {
  const _NoteProjectAndCategoryWidget();

  @override
  State<_NoteProjectAndCategoryWidget> createState() => _NoteProjectAndCategoryWidgetState();
}

class _NoteProjectAndCategoryWidgetState extends State<_NoteProjectAndCategoryWidget> {
  List<String> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    final noteCubit = context.read<NoteDetailsCubit>();
    final noteCategory = noteCubit.note.noteCategory;
    final project = noteCubit.note.projectId;
    return InkWell(
      // TODO: Должно открывать модальное окно для выбора категории
      onTap: () => SelectDialog.showModal<String>(
        context,
        items: ['Apple', 'Banana', 'Orange', 'Grape'],
        multipleSelectedValues: selectedItems,
        label: 'Выберите фрукты',

        // Убираем кнопку OK
        okButtonBuilder: (context, onPressed) => const SizedBox.shrink(),

        // Сохранение происходит при каждом изменении
        onMultipleItemsChange: (selectedList) {
          setState(() {
            selectedItems = selectedList;
          });
          talker.debug('Автосохранение: $selectedList');
        },

        itemBuilder: (context, item, isSelected) {
          return ListTile(
            leading: Icon(
              isSelected ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isSelected ? Colors.green : Colors.grey,
            ),
            title: Text(item),
            tileColor: isSelected ? Colors.green[50] : null,
          );
        },
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
  const _NoteTagsWidget();

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
  const _NoteTagWidget({required this.text});
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

class _NoteDescriptionWidget extends StatefulWidget {
  const _NoteDescriptionWidget();

  @override
  State<_NoteDescriptionWidget> createState() => _NoteDescriptionWidgetState();
}

class _NoteDescriptionWidgetState extends State<_NoteDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<NoteDetailsCubit>().descriptionController;
    return Column(
      children: [
        QuillSimpleToolbar(
          controller: controller,
          config: const QuillSimpleToolbarConfig(
            multiRowsDisplay: true,
          ),
        ),
        QuillEditor.basic(
          controller: controller,
          config: const QuillEditorConfig(),
        ),
      ],
    );
  }
}

Future<void> _updateNote(BuildContext context) async {
  final noteCubit = context.read<NoteDetailsCubit>();
  await noteCubit.saveNote();
  final noteBloc = context.read<ListNoteBloc>();
  noteBloc.add(ListNoteEvent.loadNotes(noteCubit.note.noteCategory));
  context.router.pop();
}
