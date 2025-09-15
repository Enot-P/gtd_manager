import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gtd_manager/features/notes/view/widgets/widgets.dart';

@RoutePage()
class ListNotesScreen extends StatefulWidget {
  const ListNotesScreen({
    super.key,
  });

  @override
  State<ListNotesScreen> createState() => _ListNotesScreenState();
}

class _ListNotesScreenState extends State<ListNotesScreen> {
  final String name = 'Корзина дел';
  final String description = 'Здесь размещено все что приходит в голову';
  final List<NoteWidget> notesWidget = List.generate(
    100,
    (index) => NoteWidget(
      key: Key(
        '$index',
      ),
      name: 'Карточка $index',
    ),
  );

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
            child: ReorderableListView(
              // TODO: Здесь надо будет через БД еще реализовать смену индексов
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (oldIndex < newIndex) {
                    newIndex -= 1;
                  }
                  final item = notesWidget.removeAt(oldIndex);
                  notesWidget.insert(newIndex, item);
                });
              },
              children: notesWidget,
            ),
          ),
        ],
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
