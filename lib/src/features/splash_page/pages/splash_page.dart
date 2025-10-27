import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/shared_cubits/app_locale_cubit/app_locale_cubit.dart';
import 'package:t_rent/src/common/shared_cubits/app_theme_cubit/app_theme_cubit.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/features/splash_page/cubit/splash_cubit.dart';
import 'package:t_rent/src/features/splash_page/widgets/splash_body.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  final AppLocaleCubit _appLocaleCubit = i.get<AppLocaleCubit>();
  final AppThemeCubit _themeSharedCubit = i.get<AppThemeCubit>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
    );

    _appLocaleCubit.readLocale();
    _themeSharedCubit.readThemeType();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _listener(BuildContext context, SplashState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(SplashState prev, SplashState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<SplashCubit>(
      child: BlocConsumer<SplashCubit, SplashState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<SplashCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: SplashBody(
              animationController: _controller,
              onAnimationComplete: cubit.navigateToAuth,
            ),
          );
        },
      ),
    );
  }
}
