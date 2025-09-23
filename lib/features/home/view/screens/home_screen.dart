import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
import 'package:gtd_manager/features/notes/bloc/list_note/list_note_bloc.dart';
import 'package:gtd_manager/routing/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        ListNotesRoute(
          noteCategory: NoteCategory.inbox,
          name: 'Корзина дел',
          description: 'Сюда записывается все, что приходит в голову',
        ),
        ListNotesRoute(
          noteCategory: NoteCategory.next,
          name: 'Текущие действия',
          description: '',
        ),
        ListNotesRoute(
          noteCategory: NoteCategory.waiting,
          name: 'Список ожидания',
          description: 'Эти дела, должен сделать кто-то другой',
        ),
        const CalendarRoute(),
        ListNotesRoute(
          noteCategory: NoteCategory.someday,
          name: 'Когда-нибудь',
          description: 'Тут дела, которые ты вечно откладываешь',
        ),
        const ProjectsRoute(),
        const TagsRoute(),
      ],
      appBarBuilder: (_, tabsRouter) => AppBar(
        actions: const [
          Icon(Icons.search),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
        backgroundColor: Colors.blue,
      ),
      drawer: Builder(
        builder: (context) {
          final tabsRouter = AutoTabsRouter.of(context);
          final noteBloc = context.read<ListNoteBloc>();
          void onTap({required int index, NoteCategory? noteCategory}) {
            tabsRouter.setActiveIndex(index);
            if (noteCategory != null) noteBloc.add(LoadNotes(noteCategory));
            Navigator.of(context).pop();
          }

          return Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: const Text("Корзина дел"),
                  onTap: () => onTap(index: 0, noteCategory: NoteCategory.inbox),
                ),
                ListTile(
                  title: const Text("Текущие действия"),
                  onTap: () => onTap(index: 1, noteCategory: NoteCategory.next),
                ),

                ListTile(
                  title: const Text("Ожидание"),
                  onTap: () => onTap(index: 2, noteCategory: NoteCategory.waiting),
                ),

                ListTile(
                  title: const Text("Календарь"),
                  onTap: () => onTap(index: 3, noteCategory: NoteCategory.scheduled),
                ),

                ListTile(
                  title: const Text("Когда-нибудь"),
                  onTap: () => onTap(index: 4, noteCategory: NoteCategory.waiting),
                ),
                ListTile(
                  title: const Text("Проекты"),
                  onTap: () => onTap(index: 5),
                ),
                ListTile(
                  title: const Text("Теги"),
                  onTap: () => onTap(index: 6),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
