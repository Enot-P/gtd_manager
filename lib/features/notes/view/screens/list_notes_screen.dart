import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/app/database/database.dart';
import 'package:gtd_manager/features/notes/bloc/note_bloc.dart';
import 'package:gtd_manager/features/notes/data/entyties/note_entity.dart';

@RoutePage()
class ListNotesScreen extends StatefulWidget {
  const ListNotesScreen({super.key, required this.noteCategory, required this.name, required this.description});
  final NoteCategory noteCategory;
  final String name;
  final String description;

  @override
  State<ListNotesScreen> createState() => _ListNotesScreenState();
}

class _ListNotesScreenState extends State<ListNotesScreen> {
  @override
  void initState() {
    super.initState();
    // noteBloc.add(LoadNotes());
  }

  @override
  Widget build(BuildContext context) {
    final noteBloc = context.watch<NoteBloc>();
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
            child: BlocBuilder<NoteBloc, ListNotesState>(
              bloc: noteBloc,
              builder: (context, state) {
                if (state is ListNotesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ListNotesLoaded) {
                  return ReorderableListView(
                    // TODO: Здесь надо будет через БД еще реализовать смену индексов
                    //* INFO: Этот виджет загружает все элементы сразу, надо исправить
                    onReorder: (oldIndex, newIndex) {
                      setState(() {
                        // if (oldIndex < newIndex) {
                        //   newIndex -= 1;
                        // }
                        // final item = notesWidget.removeAt(oldIndex);
                        // notesWidget.insert(newIndex, item);
                      });
                    },
                    children: state.notes,
                  );
                }
                if (state is ListNotesIsEmpty) {
                  return const Center(
                    child: Text('Список пуст'),
                  );
                }

                if (state is ListNotesFailure) {
                  return Center(
                    child: _FailureWidget(noteBloc: noteBloc, error: state.error),
                  );
                }
                return Center(
                  child: _FailureWidget(noteBloc: noteBloc, error: 'Что-то сломалось'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => noteBloc.add(
          CreateNote(
            // TODO: Надо придумать что делать с этим id
            NoteEntity(id: -999, title: 'TestName', category: NoteCategory.inbox),
          ),
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
  });

  final NoteBloc noteBloc;
  final Object? error;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$error'),
        TextButton(
          onPressed: () => noteBloc.add(LoadNotes()),
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
