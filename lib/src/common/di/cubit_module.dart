import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/shared_cubits/app_locale_cubit/app_locale_cubit.dart';
import 'package:t_rent/src/common/shared_cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:t_rent/src/common/shared_cubits/navigation_panel_cubit/navigation_panel_cubit.dart';
import 'package:t_rent/src/features/about_us_page/cubit/about_us_cubit.dart';
import 'package:t_rent/src/features/app/cubit/app_cubit.dart';
import 'package:t_rent/src/features/auth_page/cubit/auth_cubit.dart';
import 'package:t_rent/src/features/forgot_password_page/cubit/forgot_password_cubit.dart';
import 'package:t_rent/src/features/help_page/cubit/help_cubit.dart';
import 'package:t_rent/src/features/main_page/cubits/history_cubit/history_cubit.dart';
import 'package:t_rent/src/features/main_page/cubits/home_cubit/home_cubit.dart';
import 'package:t_rent/src/features/main_page/cubits/route_cubit/route_cubit.dart';
import 'package:t_rent/src/features/main_page/cubits/settings_cubit/settings_cubit.dart';
import 'package:t_rent/src/features/my_account_page/cubit/my_account_cubit.dart';
import 'package:t_rent/src/features/test_page/cubit/test_cubit.dart';

void initSharedCubits() {
  i
    ..registerSingleton<AppLocaleCubit>(
      AppLocaleCubit(),
    )
    ..registerSingleton<AppThemeCubit>(
      AppThemeCubit(),
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
    ..registerFactory<AuthCubit>(
      AuthCubit.new,
    )
    ..registerFactory<ForgotPasswordCubit>(
      ForgotPasswordCubit.new,
    )
    ..registerFactory<HomeCubit>(
      HomeCubit.new,
    )
    ..registerFactory<HistoryCubit>(
      HistoryCubit.new,
    )
    ..registerFactory<RouteCubit>(
      RouteCubit.new,
    )
    ..registerFactory<SettingsCubit>(
      SettingsCubit.new,
    )
    ..registerFactory<MyAccountCubit>(
      MyAccountCubit.new,
    )
    ..registerFactory<HelpCubit>(
      HelpCubit.new,
    )
    ..registerFactory<AboutUsCubit>(
      AboutUsCubit.new,
    )
    ..registerFactory<TestCubit>(
      TestCubit.new,
    );
}
