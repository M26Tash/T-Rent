import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/widgets/custom_button/custom_button.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';

class CarDetailsFooter extends StatelessWidget {
  final CarModel car;
  final VoidCallback onConfirmTap;
  
  const CarDetailsFooter({
    required this.car,
    required this.onConfirmTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.large,
      ),
      color: context.theme.surfaceColor,
      height: AppDimensions.kDetailsBottomNavigationBarHeight,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${car.carPricing.perDay}₺',
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightBold,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: AppDimensions.small,
                    ),
                  ),
                  TextSpan(
                    text: '/',
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                  const WidgetSpan(
                    child: SizedBox(
                      width: AppDimensions.small,
                    ),
                  ),
                  TextSpan(
                    text: context.locale.day,
                    style: context.themeData.textTheme.headlineMedium?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                ],
              ),
            ),
            CustomButton(
              padding: const EdgeInsets.all(AppDimensions.medium),
              buttonText: context.locale.bookNow,
              onTap: onConfirmTap,
            ),
          ],
        ),
      ),
    );
  }
}
