import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/shared_cubits/app_locale_cubit/app_locale_cubit.dart';
import 'package:t_rent/src/common/shared_cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:t_rent/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:t_rent/src/features/about_us_page/cubit/about_us_cubit.dart';
import 'package:t_rent/src/features/app/cubit/app_cubit.dart';
import 'package:t_rent/src/features/auth_page/cubit/auth_cubit.dart';
import 'package:t_rent/src/features/booking_page/cubit/booking_cubit.dart';
import 'package:t_rent/src/features/car_details_page/cubit/car_details_cubit.dart';
import 'package:t_rent/src/features/forgot_password_page/cubit/forgot_password_cubit.dart';
import 'package:t_rent/src/features/help_page/cubit/help_cubit.dart';
import 'package:t_rent/src/features/main_page/cubits/history_cubit/history_cubit.dart';
import 'package:t_rent/src/features/main_page/cubits/home_cubit/home_cubit.dart';
import 'package:t_rent/src/features/main_page/cubits/route_cubit/route_cubit.dart';
import 'package:t_rent/src/features/main_page/cubits/settings_cubit/settings_cubit.dart';
import 'package:t_rent/src/features/my_account_page/cubit/my_account_cubit.dart';
import 'package:t_rent/src/features/splash_page/cubit/splash_cubit.dart';
import 'package:t_rent/src/features/test_page/cubit/test_cubit.dart';
import 'package:t_rent/src/features/user_details_page/cubit/user_details_cubit.dart';

void initSharedCubits() {
  i
    ..registerSingleton<AppLocaleCubit>(
      AppLocaleCubit(
        i.get(),
      ),
    )
    ..registerSingleton<AppThemeCubit>(
      AppThemeCubit(
        i.get(),
      ),
    )
    ..registerSingleton<NavigationPanelCubit>(
      NavigationPanelCubit(),
    );
}

void initCubits() {
  i
    ..registerFactory<AppCubit>(
      () => AppCubit(
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<SplashCubit>(
      SplashCubit.new,
    )
    ..registerFactory<AuthCubit>(
      () => AuthCubit(
        i.get(),
      ),
    )
    ..registerFactory<ForgotPasswordCubit>(
      ForgotPasswordCubit.new,
    )
    ..registerFactory<UserDetailsCubit>(
      () => UserDetailsCubit(
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<HomeCubit>(
      () => HomeCubit(
        i.get(),
      ),
    )
    ..registerFactory<HistoryCubit>(
      HistoryCubit.new,
    )
    ..registerFactory<RouteCubit>(
      () => RouteCubit(
        i.get(),
      ),
    )
    ..registerFactory<SettingsCubit>(
      () => SettingsCubit(
        i.get(),
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<CarDetailsCubit>(
      CarDetailsCubit.new,
    )
    ..registerFactory<BookingCubit>(
      BookingCubit.new,
    )
    ..registerFactory<MyAccountCubit>(
      () => MyAccountCubit(
        i.get(),
        i.get(),
        i.get(),
      ),
    )
    ..registerFactory<HelpCubit>(
      HelpCubit.new,
    )
    ..registerFactory<AboutUsCubit>(
      AboutUsCubit.new,
    )
    ..registerFactory<TestCubit>(
      () => TestCubit(
        i.get(),
      ),
    );
}
