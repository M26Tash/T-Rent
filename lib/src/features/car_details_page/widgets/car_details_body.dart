import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/drive_type.dart';
import 'package:t_rent/src/common/utils/enums/rental_plan.dart';
import 'package:t_rent/src/common/widgets/vector_button/vector_button.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/features/car_details_page/widgets/specs_grid_view.dart';

class CarDetailsBody extends StatefulWidget {
  final CarModel car;
  final ValueChanged<RentalPlan?> onPlanChanged;
  final RentalPlan? currentRentalPlan;
  final ValueChanged<DateTimeRange<DateTime>?> onRangePicked;
  final DateTimeRange<DateTime>? rangePicked;
  final double totalPrice;
  final List<DateTimeRange> bookedRanges;
  final VoidCallback onRevTapUp;
  final VoidCallback onRevTapDown;

  const CarDetailsBody({
    required this.car,
    required this.onPlanChanged,
    required this.currentRentalPlan,
    required this.onRangePicked,
    required this.rangePicked,
    required this.totalPrice,
    required this.bookedRanges,
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.locale.brand,
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightSemiBold,
                    ),
                  ),
                  Text(
                    widget.car.brand,
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.large),
                  Text(
                    context.locale.model,
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightSemiBold,
                    ),
                  ),
                  Text(
                    widget.car.model,
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.large),
                  Text(
                    context.locale.year,
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightSemiBold,
                    ),
                  ),
                  Text(
                    '${widget.car.year}',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.large),
                  Text(
                    context.locale.price,
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightSemiBold,
                    ),
                  ),
                  Text(
                    '${widget.car.carPricing.perDay}₺ / ${context.locale.day}',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  width: context.availableWidth * 0.6,
                  child: CachedNetworkImage(
                    imageUrl: widget.car.carImage.frontView,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: Shimmer.fromColors(
                        baseColor: context.theme.overlayBackgroundColor,
                        highlightColor: context.theme.accentColor,
                        child: Image.asset(
                          width: context.availableWidth,
                          AppAssets.audiQ7Front,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: VectorImage(
                        height: AppDimensions.errorWidgetIconSize,
                        width: AppDimensions.errorWidgetIconSize,
                        svgAssetPath: AppAssets.brokenImageIcon,
                      ),
                    ),
                    fadeInDuration: const Duration(milliseconds: 300),
                    fadeOutDuration: const Duration(milliseconds: 150),
                  ),
                ),
                if (widget.car.carMotorRevAsset != null)
                  Positioned(
                    right: 0,
                    top: 40,
                    child: VectorButton(
                      onTapDown: widget.onRevTapDown,
                      onTapUp: widget.onRevTapUp,
                      buttonColor: context.theme.primaryColor,
                      iconColor: context.theme.tertiaryIconColor,
                      svgAssetPath: AppAssets.gasReleaseIcon,
                      pressedSvgAssetPath: AppAssets.gasPressIcon,
                    ),
                  ),
              ],
            ),
          ],
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
