import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gtd_manager/routing/app_router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        ListNotesRoute(),
        ListNotesRoute(),
        ListNotesRoute(),
        CalendarRoute(),
        ListNotesRoute(),
        ProjectsRoute(),
        TagsRoute(),
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
          return Drawer(
            child: ListView(
              children: [
                ListTile(
                  title: const Text("Корзина дел"),
                  onTap: () {
                    tabsRouter.setActiveIndex(0);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text("Текущие действия"),
                  onTap: () {
                    tabsRouter.setActiveIndex(1);
                    Navigator.of(context).pop();
                  },
                ),

                ListTile(
                  title: const Text("Ожидание"),
                  onTap: () {
                    tabsRouter.setActiveIndex(2);
                    Navigator.of(context).pop();
                  },
                ),

                ListTile(
                  title: const Text("Календарь"),
                  onTap: () {
                    tabsRouter.setActiveIndex(3);
                    Navigator.of(context).pop();
                  },
                ),

                ListTile(
                  title: const Text("Когда-нибудь"),
                  onTap: () {
                    tabsRouter.setActiveIndex(4);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text("Проекты"),
                  onTap: () {
                    tabsRouter.setActiveIndex(5);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text("Теги"),
                  onTap: () {
                    tabsRouter.setActiveIndex(6);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
