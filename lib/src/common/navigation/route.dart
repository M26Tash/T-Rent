import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:t_rent/src/common/navigation/guards/auth_guard.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';
import 'package:t_rent/src/features/about_us_page/pages/about_us_page.dart';
import 'package:t_rent/src/features/auth_page/page/auth_page.dart';
import 'package:t_rent/src/features/booking_page/page/booking_page.dart';
import 'package:t_rent/src/features/car_details_page/page/car_details_page.dart';
import 'package:t_rent/src/features/forgot_password_page/page/forgot_password_page.dart';
import 'package:t_rent/src/features/help_page/page/help_page.dart';
import 'package:t_rent/src/features/main_page/page/main_page.dart';
import 'package:t_rent/src/features/my_account_page/pages/my_account_page.dart';
import 'package:t_rent/src/features/splash_page/pages/splash_page.dart';
import 'package:t_rent/src/features/test_page/pages/test_page.dart';

part 'route.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: AuthRoute.page,
          guards: [
            AuthGuard(),
          ],
        ),
        AutoRoute(
          page: MainRoute.page,
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
        ),
        AutoRoute(
          page: CarDetailsRoute.page,
        ),
        AutoRoute(
          page: BookingRoute.page,
        ),
        AutoRoute(
          page: MyAccountRoute.page,
        ),
        AutoRoute(
          page: HelpRoute.page,
        ),
        AutoRoute(
          page: AboutUsRoute.page,
        ),
        AutoRoute(
          page: TestRoute.page,
        ),
      ];
}
