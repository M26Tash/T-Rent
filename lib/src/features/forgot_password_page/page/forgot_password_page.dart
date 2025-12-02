import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/features/forgot_password_page/cubit/forgot_password_cubit.dart';
import 'package:t_rent/src/features/forgot_password_page/widgets/forgot_password_body.dart';

@RoutePage()
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  void _listener(BuildContext context, ForgotPasswordState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(ForgotPasswordState prev, ForgotPasswordState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ForgotPasswordCubit>(
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<ForgotPasswordCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: ForgotPasswordBody(
              cubit: cubit,
              currentPageIndex: state.currentPageIndex,
              email: state.email ?? '',
              password: state.password ?? '',
            ),
          );
        },
      ),
    );
  }
}
