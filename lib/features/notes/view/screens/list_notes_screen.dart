import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/features/notes/bloc/note_bloc.dart';
import 'package:gtd_manager/features/notes/view/widgets/widgets.dart';

@RoutePage()
class ListNotesScreen extends StatefulWidget {
  const ListNotesScreen({super.key});

  @override
  State<ListNotesScreen> createState() => _ListNotesScreenState();
}

class _ListNotesScreenState extends State<ListNotesScreen> {
  final String name = 'Корзина дел';
  final String description = 'Здесь размещено все что приходит в голову';
  final noteBloc = NoteBloc();
  // final List<NoteWidget> notesWidget = List.generate(
  //   100,
  //   (index) => NoteWidget(
  //     key: Key(
  //       '$index',
  //     ),
  //     name: 'Карточка $index',
  //   ),
  // );a

  @override
  void initState() {
    super.initState();
    noteBloc.add(LoadNotes());
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
              name: name,
              description: description,
            ),
          ),
          Expanded(
            child: BlocBuilder<NoteBloc, NoteState>(
              bloc: noteBloc,
              builder: (context, state) {
                if (state is NoteLoaded) {
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

                if (state is NoteFailure) {
                  return Center(
                    child: Text('${state.error}'),
                  );
                }
                return const Center(
                  child: Text('Чето пошло не так'),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    super.key,
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
