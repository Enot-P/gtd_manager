import 'package:auto_route/auto_route.dart';
import 'package:gtd_manager/features/features.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    /// routes go here
  ];
}
