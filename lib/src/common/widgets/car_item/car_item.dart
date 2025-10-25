import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';

class CarItem extends StatelessWidget {
  final VoidCallback onCarTap;
  final MockCar mockCar;

  const CarItem({
    required this.onCarTap,
    required this.mockCar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCarTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimensions.large),
        padding: const EdgeInsets.all(AppDimensions.large),
        height: context.availableHeight * 0.27,
        width: context.availableWidth,
        decoration: BoxDecoration(
          color: context.theme.surfaceColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.medium,
            ),
          ),
        ),
        child: Stack(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: mockCar.brand,
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
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
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              height: context.availableHeight,
              width: context.availableWidth,
              mockCar.assets.sideView,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.small,
                      horizontal: AppDimensions.medium,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.backgroundColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          AppDimensions.large,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        VectorImage(
                          svgAssetPath: AppAssets.gasStationIcon,
                          color: context.theme.secondaryIconColor,
                        ),
                        const SizedBox(width: AppDimensions.medium),
                        Text(
                          mockCar.consumption,
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
                            color: context.theme.secondaryTextColor,
                            fontWeight: AppFonts.weightMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppDimensions.medium),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: AppDimensions.small,
                      horizontal: AppDimensions.medium,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.backgroundColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          AppDimensions.large,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        VectorImage(
                          svgAssetPath: AppAssets.userIcon,
                          color: context.theme.secondaryIconColor,
                        ),
                        const SizedBox(width: AppDimensions.medium),
                        Text(
                          mockCar.seats,
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
                            color: context.theme.secondaryTextColor,
                            fontWeight: AppFonts.weightMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${mockCar.rentalPlanRate.pricePerDay}₺',
                          style:
                              // ignore: lines_longer_than_80_chars
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
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
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
                          text: 'Day',
                          style: context.themeData.textTheme.headlineMedium
                              ?.copyWith(
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
          ],
        ),
      ),
    );
  }
}
