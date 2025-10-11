import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/shared_cubits/app_locale_cubit/app_locale_cubit.dart';
import 'package:t_rent/src/common/shared_cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:t_rent/src/features/app/cubit/app_cubit.dart';
import 'package:t_rent/src/features/test_page/cubit/test_cubit.dart';

void initSharedCubits() {
  i
    ..registerSingleton<AppLocaleCubit>(
      AppLocaleCubit(),
    )
    ..registerSingleton<AppThemeCubit>(
      AppThemeCubit(),
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
    ..registerFactory<TestCubit>(
      TestCubit.new,
    );
}
