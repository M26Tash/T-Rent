import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/features/confirmation_page/cubit/confirmation_cubit.dart';
import 'package:t_rent/src/features/confirmation_page/widgets/confirmation_body.dart';

@RoutePage()
class ConfirmationPage extends StatelessWidget {
  // final CarModel car;
  // final DateTime selectedStart;
  // final DateTime selectedEnd;

  const ConfirmationPage({
    // required this.car,
    // required this.selectedStart,
    // required this.selectedEnd,
    super.key,
  });

  void _listener(BuildContext context, ConfirmationState state) {
    if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(ConfirmationState prev, ConfirmationState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<ConfirmationCubit>(
      child: BlocConsumer<ConfirmationCubit, ConfirmationState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final cubit = CubitScope.of<ConfirmationCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              onLeadingTap: cubit.navigateBack,
              title: 'Confirmation',
            ),
            body: ConfirmationBody(
              // car: Car,
            ),
          );
        },
      ),
    );
  }
}
