import 'package:auto_route/auto_route.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:gtd_manager/app/app.dart';
import 'package:gtd_manager/main.dart';
import 'package:gtd_manager/routing/app_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class GtdManager extends StatefulWidget {
  const GtdManager({super.key});

  @override
  State<GtdManager> createState() => _GtdManagerState();
}

class _GtdManagerState extends State<GtdManager> {
  final config = AppConfig(
    // talker: TalkerFlutter.init(),
    appRouter: AppRouter(),
  );

  @override
  Widget build(BuildContext context) {
    return AppInitializer(
      config: config,
      child: CalendarControllerProvider(
        controller: EventController(),
        child: MaterialApp.router(
          title: 'GTD Manager',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          ),
          routerDelegate: AutoRouterDelegate(
            config.appRouter,
            navigatorObservers: () => [TalkerRouteObserver(talker)],
          ),
          routeInformationParser: config.appRouter.defaultRouteParser(),
          localizationsDelegates: const [
            FlutterQuillLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
