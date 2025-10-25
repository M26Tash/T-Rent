import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/features/auth_page/cubit/auth_cubit.dart';
import 'package:t_rent/src/features/auth_page/widgets/login_body.dart';
import 'package:t_rent/src/features/auth_page/widgets/register_body.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  Widget showBody({
    required AuthCubit cubit,
    required bool showLogin,
  }) {
    if (showLogin) {
      return LoginBody(
        authCubit: cubit,
      );
    }

    return RegisterBody(
      authCubit: cubit,
    );
  }

  void _listener(BuildContext context, AuthState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(AuthState prev, AuthState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<AuthCubit>(
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final authCubit = CubitScope.of<AuthCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: SafeArea(
              child: showBody(
                cubit: authCubit,
                showLogin: state.showLogin,
              ),
            ),
          );
        },
      ),
    );
  }
}
