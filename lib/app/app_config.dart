import 'package:gtd_manager/routing/app_router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppConfig {
  AppConfig({
    required this.talker,
    required this.appRouter,
  });
  final Talker talker;
  final AppRouter appRouter;
}
