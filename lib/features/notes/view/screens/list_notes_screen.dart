import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/domain/domain.dart';
import 'package:gtd_manager/features/notes/notes.dart';

@RoutePage()
class ListNotesScreen extends StatefulWidget {
  const ListNotesScreen({
    super.key,
    required this.noteCategory,
    required this.name,
    required this.description,
  });
  final NoteCategory noteCategory;
  final String name;
  final String description;

  @override
  State<ListNotesScreen> createState() => _ListNotesScreenState();
}

class _ListNotesScreenState extends State<ListNotesScreen> {
  late final ListNoteBloc noteBloc;

  @override
  void initState() {
    super.initState();
    noteBloc = context.read<ListNoteBloc>();
    noteBloc.add(ListNoteEvent.loadNotes(widget.noteCategory));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
            child: _HeaderWidget(
              name: widget.name,
              description: widget.description,
            ),
          ),
          Expanded(
            child: BlocBuilder<ListNoteBloc, ListNotesState>(
              bloc: noteBloc,
              builder: (context, state) {
                return state.when(
                  loading: () => const Center(child: CircularProgressIndicator()),
                  loaded: (List<NoteEntity> notes) => notes.isNotEmpty
                      ? _ListNotesWidget(notes: notes)
                      : const Center(
                          child: Text('Список пуст'),
                        ),
                  failure: (Object? error) => Center(
                    child: _FailureWidget(
                      noteBloc: noteBloc,
                      error: error,
                      noteCategory: widget.noteCategory,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          shape: const RoundedRectangleBorder(),
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets, // Чтобы под клавиатуру подстраивалась
              child: BottomSheetCreateNote(noteCategory: widget.noteCategory),
            );
          },
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _FailureWidget extends StatelessWidget {
  const _FailureWidget({
    required this.noteBloc,
    required this.error,
    required this.noteCategory,
  });

  final ListNoteBloc noteBloc;
  final Object? error;
  final NoteCategory noteCategory;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$error'),
        TextButton(
          onPressed: () => noteBloc.add(ListNoteEvent.loadNotes(noteCategory)),
          child: const Text('Попробовать снова'),
        ),
      ],
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    required this.name,
    required this.description,
  });
  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          description,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

class _ListNotesWidget extends StatelessWidget {
  const _ListNotesWidget({
    required this.notes,
  });

  final List<NoteEntity> notes;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      onReorder: (oldIndex, newIndex) {
        final noteBloc = context.read<ListNoteBloc>();
        if (oldIndex < newIndex) {
          newIndex -= 1;
        }
        final firstId = notes[oldIndex].id;
        final secondId = notes[newIndex].id;
        final firstKeyOrder = notes[oldIndex].keyOrder;
        final secondKeyOrder = notes[newIndex].keyOrder;

        if (firstId == null || secondId == null || firstKeyOrder == null || secondKeyOrder == null) {
          throw 'Перестановка заметок произошла с ошибкой';
        }
        // Меняю в бд
        noteBloc.add(
          ListNoteEvent.changeNotesKeyOrder(
            notes: notes,
            oldIndex: oldIndex,
            newIndex: newIndex,
          ),
        );
      },
      itemBuilder: (BuildContext context, int index) {
        final note = notes[index];
        return NoteWidget(key: ValueKey(note.id), note: note);
      },
      itemCount: notes.length,
    );
  }
}
