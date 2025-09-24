import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
import 'package:gtd_manager/features/notes/bloc/list_note/list_note_bloc.dart';
import 'package:gtd_manager/routing/app_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onTapTab(BuildContext context, {required int index, NoteCategory? noteCategory}) {
    final tabsRouter = AutoTabsRouter.of(context);
    final noteBloc = context.read<ListNoteBloc>();

    tabsRouter.setActiveIndex(index);
    if (noteCategory != null) noteBloc.add(ListNoteEvent.loadNotes(noteCategory));
    Navigator.of(context).pop();
  }

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
      appBarBuilder: (context, tabsRouter) {
        final talker = context.watch<Talker>();
        return AppBar(
          actions: [
            const Icon(Icons.search),
            const Icon(Icons.more_vert),
            IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => TalkerScreen(talker: talker),
                ),
              ),
              icon: const Icon(Icons.help),
            ),
            const SizedBox(width: 10),
          ],
          backgroundColor: Colors.blue,
        );
      },
      drawer: Builder(
        builder: (context) {
          return Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: const Text("Корзина дел"),
                  onTap: () => _onTapTab(context, index: 0, noteCategory: NoteCategory.inbox),
                ),
                ListTile(
                  title: const Text("Текущие действия"),
                  onTap: () => _onTapTab(context, index: 1, noteCategory: NoteCategory.next),
                ),

                ListTile(
                  title: const Text("Ожидание"),
                  onTap: () => _onTapTab(context, index: 2, noteCategory: NoteCategory.waiting),
                ),

                ListTile(
                  title: const Text("Календарь"),
                  onTap: () => _onTapTab(context, index: 3, noteCategory: NoteCategory.scheduled),
                ),

                ListTile(
                  title: const Text("Когда-нибудь"),
                  onTap: () => _onTapTab(context, index: 4, noteCategory: NoteCategory.waiting),
                ),
                ListTile(
                  title: const Text("Проекты"),
                  onTap: () => _onTapTab(context, index: 5),
                ),
                ListTile(
                  title: const Text("Теги"),
                  onTap: () => _onTapTab(context, index: 6),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
