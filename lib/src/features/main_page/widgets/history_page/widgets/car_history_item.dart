import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';

class CarHistoryItem extends StatelessWidget {
  final MockCar mockCar;
  const CarHistoryItem({
    required this.mockCar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: AppDimensions.large),
          padding: const EdgeInsets.all(AppDimensions.large),
          height: context.availableHeight * 0.24,
          width: context.availableWidth,
          decoration: BoxDecoration(
            color: context.theme.surfaceColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(
                AppDimensions.preLarge,
              ),
            ),
            border: BoxBorder.all(
              color: context.theme.accentColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: mockCar.brand,
                      style:
                          context.themeData.textTheme.headlineLarge?.copyWith(
                        color: context.theme.primaryTextColor,
                        fontWeight: AppFonts.weightBold,
                      ),
                    ),
                    const WidgetSpan(
                      child: SizedBox(
                        width: AppDimensions.medium,
                      ),
                    ),
                    TextSpan(
                      text: mockCar.model,
                      style:
                          context.themeData.textTheme.headlineLarge?.copyWith(
                        color: context.theme.primaryTextColor,
                        fontWeight: AppFonts.weightMedium,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Oct 20, 2025 - Oct 23, 2025\n(3 Days)',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
              const SizedBox(height: AppDimensions.large),
              const Spacer(),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '10,000',
                      style:
                          context.themeData.textTheme.displayMedium?.copyWith(
                        fontSize: AppFonts.sizeDisplayPreLarge,
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
                      text: 'km',
                      style:
                          context.themeData.textTheme.headlineLarge?.copyWith(
                        color: context.theme.primaryTextColor,
                        fontWeight: AppFonts.weightMedium,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '${mockCar.rentalPlanRate.pricePerDay * 3}₺',
                      style:
                          context.themeData.textTheme.headlineLarge?.copyWith(
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
                      style:
                          context.themeData.textTheme.headlineMedium?.copyWith(
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
                      text: '3 Days',
                      style:
                          context.themeData.textTheme.headlineMedium?.copyWith(
                        color: context.theme.primaryTextColor,
                        fontWeight: AppFonts.weightMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: -context.availableWidth * 0.27,
          child: SizedBox(
            width: context.availableWidth * 0.8,
            child: FittedBox(
              alignment: Alignment.centerRight,
              child: Image.asset(
                mockCar.assets.sideView,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
