import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/localization/flutter_gen/app_localizations.dart';
import 'package:t_rent/src/common/navigation/route.dart';
import 'package:t_rent/src/common/theme/app_theme.dart';
import 'package:t_rent/src/common/theme/t_rent_theme.dart';
import 'package:t_rent/src/common/theme/theme_provider.dart';
import 'package:t_rent/src/common/utils/enums/theme_type.dart';
import 'package:t_rent/src/features/app/cubit/app_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();

    _appRouter = AppRouter();
  }

  TRentTheme _trentTheme(AppState state) {
    return switch (state.themeType) {
      ThemeType.light => lightTheme,
      ThemeType.dark => darkTheme,
    };
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AppCubit>(
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, appState) {
          final theme = _trentTheme(appState);
          return ThemeProvider(
            theme: theme,
            themeData: generateThemeData(theme),
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                LocaleNamesLocalizationsDelegate(),
                ...AppLocalization.localizationsDelegates,
              ],
              supportedLocales: AppLocalization.supportedLocales,
              locale: appState.locale,
              routerConfig: _appRouter.config(),
            ),
          );
        },
      ),
    );
  }
}
