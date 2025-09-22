import 'package:flutter/material.dart';
import 'package:gtd_manager/app/app.dart';
import 'package:gtd_manager/routing/app_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class GtdManager extends StatefulWidget {
  const GtdManager({super.key});

  @override
  State<GtdManager> createState() => _GtdManagerState();
}

class _GtdManagerState extends State<GtdManager> {
  final config = AppConfig(
    talker: TalkerFlutter.init(),
    appRouter: AppRouter(),
  );

  @override
  Widget build(BuildContext context) {
    return AppInitializer(
      config: config,
      child: MaterialApp.router(
        title: 'GTD Manager',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        ),
        routerConfig: config.appRouter.config(),
      ),
    );
  }
}
