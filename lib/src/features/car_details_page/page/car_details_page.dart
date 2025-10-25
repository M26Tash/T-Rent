import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';
import 'package:t_rent/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:t_rent/src/features/car_details_page/cubit/car_details_cubit.dart';
import 'package:t_rent/src/features/car_details_page/widgets/car_details_body.dart';
import 'package:t_rent/src/features/car_details_page/widgets/reservation_slider.dart';

@RoutePage()
class CarDetailsPage extends StatelessWidget {
  final MockCar mockCar;

  const CarDetailsPage({
    required this.mockCar,
    super.key,
  });

  void _listener(BuildContext context, CarDetailsState state) {
    if (state.route.type == TypeRoute.pop) {
      context.maybePop();
    } else if (state.route.type != null) {
      context.navigateToRoute(state.route);
    }
  }

  bool _listenWhen(CarDetailsState prev, CarDetailsState current) {
    return prev.route.type == null && current.route.type != null;
  }

  @override
  Widget build(BuildContext context) {
    return CubitScope<CarDetailsCubit>(
      child: BlocConsumer<CarDetailsCubit, CarDetailsState>(
        listener: _listener,
        listenWhen: _listenWhen,
        builder: (context, state) {
          final carDetailsCubit = CubitScope.of<CarDetailsCubit>(context);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              onLeadingTap: carDetailsCubit.navigateBack,
              title: context.locale.details,
            ),
            body: CarDetailsBody(
              mockCar: mockCar,
              onPlanChanged: carDetailsCubit.chooseRentalPlan,
              currentRentalPlan: state.rentalPlan,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: state.rentalPlan == null
                ? null
                : ReservationSlider(
                    onSubmit: carDetailsCubit.navigateToBooking,
                  ),
          );
        },
      ),
    );
  }
}
