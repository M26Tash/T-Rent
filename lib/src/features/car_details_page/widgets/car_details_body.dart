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
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';
import 'package:t_rent/src/features/car_details_page/widgets/rental_plan_item.dart';
import 'package:t_rent/src/features/car_details_page/widgets/specs_grid_view.dart';

class CarDetailsBody extends StatefulWidget {
  final CarModel car;
  final ValueChanged<RentalPlan?> onPlanChanged;
  final RentalPlan? currentRentalPlan;

  const CarDetailsBody({
    required this.car,
    required this.onPlanChanged,
    required this.currentRentalPlan,
    super.key,
  });

  @override
  State<CarDetailsBody> createState() => _CarDetailsBodyState();
}

class _CarDetailsBodyState extends State<CarDetailsBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
  }

  @override
  void didUpdateWidget(CarDetailsBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentRentalPlan == null &&
        widget.currentRentalPlan != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
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
            SizedBox(
              width: context.availableWidth * 0.6,
              child: CachedNetworkImage(
                imageUrl: widget.car.carImage.frontView,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: context.theme.overlayBackgroundColor,
                  highlightColor: context.theme.accentColor,
                  child: Image.asset(
                    height: context.availableHeight,
                    width: context.availableWidth,
                    AppAssets.testFrontView,
                    fit: BoxFit.cover,
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
              asset: AppAssets.drivingIcon,
              specsTitle: context.locale.driveType,
              specsDetail: widget.car.carSpecs.driveType.toDisplayString(),
            ),
            SpecsItem(
              asset: AppAssets.drivingIcon,
              specsTitle: context.locale.engine,
              specsDetail: context.locale.engineValue(
                widget.car.carSpecs.engineCapacity,
              ),
            ),
            SpecsItem(
              asset: AppAssets.drivingIcon,
              specsTitle: context.locale.horsepower,
              specsDetail: context.locale.horsepowerValue(
                widget.car.carSpecs.horsepower,
              ),
            ),
            SpecsItem(
              asset: AppAssets.drivingIcon,
              specsTitle: context.locale.topSpeed,
              specsDetail: context.locale.topSpeedValue(
                widget.car.carSpecs.topSpeed,
              ),
            ),
            SpecsItem(
              asset: AppAssets.drivingIcon,
              specsTitle: context.locale.acceleration,
              specsDetail: context.locale.accelerationValue(
                widget.car.carSpecs.zeroToHundred,
              ),
            ),
            SpecsItem(
              asset: AppAssets.drivingIcon,
              specsTitle: context.locale.torque,
              specsDetail: context.locale.torqueValue(
                widget.car.carSpecs.torque,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.large),
        Text(
          context.locale.rentalPlan,
          style: context.themeData.textTheme.headlineLarge?.copyWith(
            color: context.theme.primaryTextColor,
            fontWeight: AppFonts.weightBold,
          ),
        ),
        const SizedBox(height: AppDimensions.medium),
        for (int i = 0; i < RentalPlan.values.length; i++)
          RentalPlanItem(
            carPricing: widget.car.carPricing,
            plan: RentalPlan.values[i],
            currentPlan: widget.currentRentalPlan,
            onPlanChanged: widget.onPlanChanged,
          ),
        if (widget.currentRentalPlan != null)
          const SizedBox(height: AppDimensions.extremeLarge),
      ],
    );
  }
}
