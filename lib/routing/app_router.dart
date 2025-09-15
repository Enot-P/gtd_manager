import 'package:auto_route/auto_route.dart';
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
        AutoRoute(page: DetailsNoteRoute.page, path: 'detailsNote'),
      ],
    ),
  ];
}
