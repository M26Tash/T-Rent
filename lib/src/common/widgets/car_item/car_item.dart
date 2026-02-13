import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/fuel_type.dart';
import 'package:t_rent/src/common/utils/formatter/currency_formatter.dart';
import 'package:t_rent/src/common/widgets/vector_image/vector_image.dart';
import 'package:t_rent/src/core/domain/entities/car_model/car_model.dart';

class CarItem extends StatelessWidget {
  final VoidCallback onCarTap;

  final CarModel car;

  // ignore: lines_longer_than_80_chars
  /// The [header] parameter is set to null by the defualt. All widgets that assing to header will be used as {Row(children:header)}
  final List<Widget>? header;
  // ignore: lines_longer_than_80_chars
  /// The [footer] parameter is set to null by the defualt. All widgets that assing to footer will be used as {Row(children:footer)}
  final List<Widget>? footer;

  final List<BoxShadow>? boxShadow;

  const CarItem({
    required this.onCarTap,
    required this.car,
    this.header,
    this.footer,
    this.boxShadow,
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
          color: car.fuelType == FuelType.electric
              ? context.theme.electricSurfaceColor
              : context.theme.surfaceColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppDimensions.medium,
            ),
          ),
          boxShadow: boxShadow,
        ),
        child: Stack(
          children: [
            _CarItemHeader(
              header: header,
              car: car,
            ),
            _CarCenterImage(asset: car.carImage.sideView),
            _CarItemFooter(footer: footer, car: car),
          ],
        ),
      ),
    );
  }
}

class _CarCenterImage extends StatelessWidget {
  final String asset;

  const _CarCenterImage({
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: asset,
        fit: BoxFit.cover,
        width: context.availableWidth,
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
    );
  }
}

class _CarItemHeader extends StatelessWidget {
  final List<Widget>? header;
  final CarModel car;

  const _CarItemHeader({
    required this.header,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: header ??
          [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: car.brand,
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
                    text: car.model,
                    style: context.themeData.textTheme.headlineLarge?.copyWith(
                      color: context.theme.primaryTextColor,
                      fontWeight: AppFonts.weightMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
    );
  }
}

class _CarItemFooter extends StatelessWidget {
  final List<Widget>? footer;
  final CarModel car;

  const _CarItemFooter({
    required this.footer,
    required this.car,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: footer ??
            [
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
                    if (car.fuelType != FuelType.electric)
                      Text(
                        '${car.fuelConsumption}L',
                        style: context.themeData.textTheme.headlineMedium
                            ?.copyWith(
                          color: context.theme.secondaryTextColor,
                          fontWeight: AppFonts.weightMedium,
                        ),
                      ),
                    if (car.fuelType == FuelType.electric)
                      Text(
                        '${car.fuelConsumption}kWh',
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
                      '${car.seats}',
                      style:
                          context.themeData.textTheme.headlineMedium?.copyWith(
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
                      text: CurrencyFormatter.format(
                        car.carPricing.perDay,
                      ),
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
                      text: context.locale.day,
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
    );
  }
}
