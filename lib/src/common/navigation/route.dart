import 'package:auto_route/auto_route.dart';
import 'package:t_rent/src/features/auth_page/page/auth_page.dart';
import 'package:t_rent/src/features/forgot_password_page/page/forgot_password_page.dart';
import 'package:t_rent/src/features/test_page/pages/test_page.dart';

part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          initial: true
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
        ),
        AutoRoute(
          page: TestRoute.page,
        ),
      ];
}
