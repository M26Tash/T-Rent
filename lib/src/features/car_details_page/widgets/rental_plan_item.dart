import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/rental_plan.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

class RentalPlanItem extends StatelessWidget {
  final ValueChanged<RentalPlan?> onPlanChanged;
  final RentalPlanRate rentalPlanRate;
  final RentalPlan rentalPlan;
  final RentalPlan? currentRentalPlan;

  const RentalPlanItem({
    required this.onPlanChanged,
    required this.rentalPlanRate,
    required this.rentalPlan,
    required this.currentRentalPlan,
    super.key,
  });

  String rentalRateTitle(RentalPlan plan) {
    return switch (plan) {
      RentalPlan.hourly => 'Hourly',
      RentalPlan.daily => 'Daily',
      RentalPlan.weekly => 'Weekly',
    };
  }

  double rentalRateFee(RentalPlan plan) {
    return switch (plan) {
      RentalPlan.hourly => rentalPlanRate.pricePerHour,
      RentalPlan.daily => rentalPlanRate.pricePerDay,
      RentalPlan.weekly => rentalPlanRate.pricePerWeek,
    };
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (rentalPlan == currentRentalPlan) {
          onPlanChanged(null);
        } else {
          onPlanChanged(rentalPlan);
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
          border: currentRentalPlan == rentalPlan
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
                  rentalRateTitle(rentalPlan),
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.primaryTextColor,
                    fontWeight: AppFonts.weightBold,
                  ),
                ),
                Text(
                  '${rentalRateFee(rentalPlan)}₺',
                  style: context.themeData.textTheme.headlineSmall?.copyWith(
                    color: context.theme.primaryTextColor,
                    fontWeight: AppFonts.weightMedium,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: currentRentalPlan == rentalPlan
                      ? context.theme.primaryColor
                      : context.theme.overlayBackgroundColor,
                  width: AppDimensions.extraSmall,
                ),
              ),
              child: currentRentalPlan == rentalPlan
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
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
