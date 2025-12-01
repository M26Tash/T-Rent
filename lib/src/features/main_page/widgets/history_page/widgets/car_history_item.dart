// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/constants/font_family.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/fuel_type.dart';
import 'package:t_rent/src/common/utils/extensions/date_time_extension.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';
import 'package:t_rent/src/core/domain/entities/car_order_model/car_order_model.dart';

class CarHistoryItem extends StatelessWidget {
  final CarOrderModel carOrder;
  final VoidCallback onCarTap;

  const CarHistoryItem({
    required this.carOrder,
    required this.onCarTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCarTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: AppDimensions.large),
        padding: const EdgeInsets.all(AppDimensions.large),
        decoration: BoxDecoration(
          color: carOrder.car.fuelType == FuelType.electric
              ? context.theme.electricSurfaceColor
              : context.theme.surfaceColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.preLarge,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        carOrder.car.brand,
                        style:
                            context.themeData.textTheme.displayMedium?.copyWith(
                          color: context.theme.primaryTextColor,
                          fontWeight: AppFonts.weightBold,
                        ),
                      ),
                      Text(
                        carOrder.car.model,
                        style:
                            context.themeData.textTheme.headlineLarge?.copyWith(
                          color: context.theme.secondaryTextColor,
                          fontWeight: AppFonts.weightMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  formatDateRange(carOrder.startDate, carOrder.endDate),
                  style: context.themeData.textTheme.headlineMedium?.copyWith(
                    color: context.theme.primaryTextColor,
                    fontWeight: AppFonts.weightMedium,
                  ),
                  softWrap: true,
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: AppDimensions.carHistoryItemHeight,
                width: context.availableWidth,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      bottom: AppDimensions.large,
                      child: Text(
                        '${carOrder.car.year}',
                        style:
                            context.themeData.textTheme.displayLarge?.copyWith(
                          fontSize: AppFonts.carYearFontSize,
                          color:
                              context.theme.primaryTextColor.withOpacity(0.5),
                          fontWeight: AppFonts.weightBold,
                          fontFamily: FontFamily.robotoFamily,
                        ),
                      ),
                    ),
                    Positioned(
                      child: Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..scaleByDouble(-1, 1, 1, 1),
                        child: CachedNetworkImage(
                          width: context.availableWidth,
                          imageUrl: carOrder.car.carImage.sideView,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: context.theme.overlayBackgroundColor,
                            highlightColor: context.theme.accentColor,
                            child: Image.asset(
                              height: context.availableHeight,
                              width: context.availableWidth,
                              AppAssets.audiQ7Side,
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
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(bottom: AppDimensions.large),
                      width: context.availableWidth,
                      height: 2,
                      color: context.theme.overlayBackgroundColor,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '${carOrder.totalPrice}₺ ',
                        style:
                            context.themeData.textTheme.headlineLarge?.copyWith(
                          color: context.theme.primaryTextColor,
                          fontWeight: AppFonts.weightBold,
                        ),
                      ),
                      TextSpan(
                        text: ' | ',
                        style:
                            context.themeData.textTheme.headlineLarge?.copyWith(
                          color: context.theme.primaryTextColor,
                          fontWeight: AppFonts.weightBold,
                        ),
                      ),
                      TextSpan(
                        text:
                            '${context.locale.days(carOrder.totalDays ?? 0)} • ${carOrder.car.carPricing.perDay}₺/${context.locale.day}',
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
                          color: context.theme.secondaryTextColor,
                          fontWeight: AppFonts.weightBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
