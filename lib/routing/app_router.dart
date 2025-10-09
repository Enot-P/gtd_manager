import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gtd_manager/domain/entities/entities.dart';
import 'package:gtd_manager/features/features.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      children: [
        AutoRoute(page: ListNotesRoute.page, path: 'listOfNotes'),
        AutoRoute(page: TagsRoute.page, path: 'tags'),
        AutoRoute(page: CalendarRoute.page, path: 'calendar'),
        AutoRoute(page: ProjectsRoute.page, path: 'project'),
      ],
    ),
    AutoRoute(page: DetailsNoteRoute.page, path: '/detailsNote'),
    AutoRoute(page: SettingsRoute.page, path: '/settings'),
  ];
}
