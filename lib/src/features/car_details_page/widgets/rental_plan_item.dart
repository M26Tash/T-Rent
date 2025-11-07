import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/rental_plan.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_pricing.dart';

class RentalPlanItem extends StatelessWidget {
  final ValueChanged<RentalPlan?> onPlanChanged;
  final CarPricing carPricing;
  final RentalPlan plan;
  final RentalPlan? currentPlan;

  const RentalPlanItem({
    required this.onPlanChanged,
    required this.carPricing,
    required this.plan,
    required this.currentPlan,
    super.key,
  });

  String rentalRateTitle(RentalPlan plan, BuildContext context) {
    return switch (plan) {
      RentalPlan.hourly => context.locale.hourly,
      RentalPlan.daily => context.locale.daily,
      RentalPlan.weekly => context.locale.weekly,
    };
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (plan == currentPlan) {
          onPlanChanged(null);
        } else {
          onPlanChanged(plan);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: AppDimensions.medium,
        ),
        padding: const EdgeInsets.all(AppDimensions.large),
        decoration: BoxDecoration(
          color: context.theme.surfaceColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.preLarge,
            ),
          ),
          border: currentPlan == plan
              ? BoxBorder.all(
                  color: context.theme.accentColor,
                )
              : null,
        ),
        child: Row(
          children: [
            const VectorImage(
              height: 28,
              width: 28,
              svgAssetPath: AppAssets.moneyIcon,
            ),
            const SizedBox(width: AppDimensions.medium),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  rentalRateTitle(plan, context),
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.primaryTextColor,
                    fontWeight: AppFonts.weightBold,
                  ),
                ),
                Text(
                  '${carPricing.priceFor(plan)}₺',
                  style: context.themeData.textTheme.headlineSmall?.copyWith(
                    color: context.theme.primaryTextColor,
                    fontWeight: AppFonts.weightMedium,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: AppDimensions.outerRadioSize,
              height: AppDimensions.outerRadioSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: currentPlan == plan
                      ? context.theme.primaryColor
                      : context.theme.overlayBackgroundColor,
                  width: AppDimensions.extraSmall,
                ),
              ),
              child: currentPlan == plan
                  ? Center(
                      child: Container(
                        width: AppDimensions.innerRadioSize,
                        height: AppDimensions.innerRadioSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: context.theme.primaryColor,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
