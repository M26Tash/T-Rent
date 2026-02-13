import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/drive_type.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/features/car_details_page/widgets/car_details_info.dart';
import 'package:t_rent/src/features/car_details_page/widgets/specs_grid_view.dart';

class CarDetailsBody extends StatefulWidget {
  final CarModel car;
  final VoidCallback onRevTapUp;
  final VoidCallback onRevTapDown;

  const CarDetailsBody({
    required this.car,
    required this.onRevTapUp,
    required this.onRevTapDown,
    super.key,
  });

  @override
  State<CarDetailsBody> createState() => _CarDetailsBodyState();
}

class _CarDetailsBodyState extends State<CarDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppDimensions.large),
      children: [
        CarDetailsInfo(
          car: widget.car,
          onRevTapUp: widget.onRevTapUp,
          onRevTapDown: widget.onRevTapDown,
        ),
        const SizedBox(height: AppDimensions.large),
        Text(
          context.locale.carSpecifications,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightBold,
          ),
        ),
        const SizedBox(height: AppDimensions.medium),
        SpecsGridView(
          specs: [
            SpecsItem(
              asset: AppAssets.driveIcon,
              specsTitle: context.locale.driveType,
              specsDetail: widget.car.carSpecs.driveType.toDisplayString(),
            ),
            SpecsItem(
              asset: AppAssets.engineIcon,
              specsTitle: context.locale.engine,
              specsDetail: context.locale.engineValue(
                widget.car.carSpecs.engineCapacity,
              ),
            ),
            SpecsItem(
              asset: AppAssets.powerIcon,
              specsTitle: context.locale.horsepower,
              specsDetail: context.locale.horsepowerValue(
                widget.car.carSpecs.horsepower,
              ),
            ),
            SpecsItem(
              asset: AppAssets.speedIcon,
              specsTitle: context.locale.topSpeed,
              specsDetail: context.locale.topSpeedValue(
                widget.car.carSpecs.topSpeed,
              ),
            ),
            SpecsItem(
              asset: AppAssets.timerIcon,
              specsTitle: context.locale.acceleration,
              specsDetail: context.locale.accelerationValue(
                widget.car.carSpecs.zeroToHundred,
              ),
            ),
            SpecsItem(
              asset: AppAssets.torqueIcon,
              specsTitle: context.locale.torque,
              specsDetail: context.locale.torqueValue(
                widget.car.carSpecs.torque,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
