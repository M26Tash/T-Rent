import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/features/test_page/cubit/test_cubit.dart';
import 'package:t_rent/src/features/test_page/widgets/test_body.dart';

@RoutePage()
class TestPage extends StatelessWidget {
  const TestPage({super.key});

  void _listener(BuildContext context, TestState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(TestState prev, TestState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<TestCubit>(
      child: BlocConsumer<TestCubit, TestState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: const TestBody(),
          );
        },
      ),
    );
  }
}
