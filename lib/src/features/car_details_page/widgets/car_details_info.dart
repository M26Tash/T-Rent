import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/extensions/double_extension.dart';
import 'package:t_rent/src/common/widgets/vector_button/vector_button.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';

class CarDetailsInfo extends StatelessWidget {
  final CarModel car;
  final VoidCallback onRevTapUp;
  final VoidCallback onRevTapDown;

  const CarDetailsInfo({
    required this.car,
    required this.onRevTapUp,
    required this.onRevTapDown,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
                car.brand,
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
                car.model,
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
                '${car.year}',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightMedium,
                ),
              ),
              const SizedBox(height: AppDimensions.large),
              Text(
                context.locale.mileage,
                style: context.themeData.textTheme.headlineLarge?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightSemiBold,
                ),
              ),
              Text(
                car.mileage.format(),
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
                imageUrl: car.carImage.frontView,
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
            if (car.carMotorRevAsset != null)
              Positioned(
                right: 0,
                top: 40,
                child: VectorButton(
                  onTapDown: onRevTapDown,
                  onTapUp: onRevTapUp,
                  buttonColor: context.theme.primaryColor,
                  iconColor: context.theme.tertiaryIconColor,
                  svgAssetPath: AppAssets.gasReleaseIcon,
                  pressedSvgAssetPath: AppAssets.gasPressIcon,
                ),
              ),
          ],
        ),
      ],
    );
  }
}
