import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/navigation/entities/auto_route_extension.dart';
import 'package:t_rent/src/common/navigation/entities/customized_route.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/features/car_details_page/cubit/car_details_cubit.dart';
import 'package:t_rent/src/features/car_details_page/widgets/car_details_body.dart';
import 'package:t_rent/src/features/car_details_page/widgets/car_details_footer.dart';

@RoutePage()
class CarDetailsPage extends StatelessWidget {
  final CarModel car;

  const CarDetailsPage({
    required this.car,
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
          final carDetailsCubit = CubitScope.of<CarDetailsCubit>(context)
            ..initFavroiteState(isFavoriteCar: car.isFavorite);
          return Scaffold(
            backgroundColor: context.theme.backgroundColor,
            appBar: CustomAppBar(
              svgAssetPath: AppAssets.arrowLeftIcon,
              onLeadingTap: carDetailsCubit.navigateBack,
              title: context.locale.details,
              actions: [
                IconButton(
                  onPressed: () => carDetailsCubit.toggleFavorite(
                    carId: car.id!,
                  ),
                  icon: state.isCarFavorite ?? true
                      ? Icon(
                          Icons.favorite_outline,
                          color: context.theme.primaryIconColor,
                        )
                      : Icon(
                          Icons.favorite,
                          color: context.theme.primaryColor,
                        ),
                ),
              ],
            ),
            body: CarDetailsBody(
              car: car,
              onRevTapDown: () => carDetailsCubit.playRev(
                revAsset: car.carMotorRevAsset!,
              ),
              onRevTapUp: carDetailsCubit.stopRev,
            ),
            bottomNavigationBar: CarDetailsFooter(
              car: car,
              onConfirmTap: () => carDetailsCubit.navigateToBooking(
                car: car,
              ),
            ),
          );
        },
      ),
    );
  }
}
