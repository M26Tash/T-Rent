import 'package:auto_route/auto_route.dart';
import 'package:t_rent/src/features/test_page/pages/test_page.dart';

part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: TestRoute.page,
          initial: true,
        ),
      ];
}
