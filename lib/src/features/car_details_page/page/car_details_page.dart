import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/di/injector.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';
import 'package:t_rent/src/features/car_details_page/cubit/car_details_cubit.dart';
import 'package:t_rent/src/features/car_details_page/widgets/car_details_body.dart';
import 'package:t_rent/src/features/car_details_page/widgets/reservation_slider.dart';

@RoutePage()
class CarDetailsPage extends StatefulWidget {
  final CarModel car;

  const CarDetailsPage({
    required this.car,
    super.key,
  });

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {
  final CarDetailsCubit _carDetailsCubit = i.get<CarDetailsCubit>();

  @override
  void initState() {
    super.initState();

    _carDetailsCubit.getCarRentHistory(
      carId: widget.car.id!,
    );
  }

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

          if (state.bookedRanges == null) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: context.theme.primaryColor,
                ),
              ),
            );
          }

          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              onLeadingTap: carDetailsCubit.navigateBack,
              title: context.locale.details,
            ),
            body: CarDetailsBody(
              car: widget.car,
              onPlanChanged: carDetailsCubit.chooseRentalPlan,
              currentRentalPlan: state.rentalPlan,
              bookedRanges: state.bookedRanges!,
              onRangePicked: (range) {
                carDetailsCubit
                  ..onRangePicked(range)
                  ..calculateTotalPrice(
                    car: widget.car,
                  )
                  ..uploadCarRent(
                    carOrder: CarOrderModel(
                      carId: widget.car.id!,
                      car: widget.car,
                      startDate: range!.start,
                      endDate: range.end,
                    ),
                    car: widget.car,
                    startDate: range.start,
                    endDate: range.end,
                  );
              },
              rangePicked: state.rangePicked,
              totalPrice: state.totalPrice,
              onRevTapDown: () => carDetailsCubit.playRev(
                revAsset: widget.car.carMotorRevAsset!,
              ),
              onRevTapUp: carDetailsCubit.stopRev,
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
