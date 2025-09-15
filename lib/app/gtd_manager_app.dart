import 'package:flutter/material.dart';
import 'package:gtd_manager/routing/app_router.dart';

class GtdManager extends StatefulWidget {
  const GtdManager({super.key});

  @override
  State<GtdManager> createState() => _GtdManagerState();
}

class _GtdManagerState extends State<GtdManager> {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GTD Manager',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
