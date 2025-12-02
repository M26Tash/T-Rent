import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/extensions/context_extension.dart';
import 'package:t_rent/src/features/auth_page/cubit/auth_cubit.dart';
import 'package:t_rent/src/features/auth_page/widgets/login_body.dart';
import 'package:t_rent/src/features/auth_page/widgets/register_body.dart';

@RoutePage()
class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  Widget showBody({
    required AuthCubit cubit,
    required bool showLogin,
    required bool isObscure,
  }) {
    if (showLogin) {
      return LoginBody(
        authCubit: cubit,
        isObscure: isObscure,
      );
    }

    return RegisterBody(
      authCubit: cubit,
      isObscure: isObscure,
    );
  }

  void _listener(BuildContext context, AuthState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }

    if (state.signInExceptionMessage != null) {
      context.showErrorSnackBar(
        state.signInExceptionMessage!,
      );
    }

    if (state.registerInExceptionMessage != null) {
      context.showErrorSnackBar(
        state.registerInExceptionMessage!,
      );
    }
  }

  bool _listenWhen(AuthState prev, AuthState current) {
    return prev.route.type == null && current.route.type != null ||
        prev.signInExceptionMessage != current.signInExceptionMessage ||
        prev.registerInExceptionMessage != current.registerInExceptionMessage ||
        prev.currentSession != current.currentSession;
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
                isObscure: state.isObscure,
              ),
            ),
          );
        },
      ),
    );
  }
}
