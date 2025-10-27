// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';
import 'package:t_rent/src/common/widgets/fade_transition_overlay/fade_transition_overlay.dart';
import 'package:t_rent/src/common/widgets/vector_button/vector_button.dart';

abstract final class SupportMethods {
  static Future<OverlayEntry?> showCarOverlay({
    required BuildContext context,
    required MapboxMap mapboxMap,
    required MockCar mockCar,
    Duration autoHideDuration = const Duration(seconds: 2),
  }) async {
    final screenCoord = await mapboxMap.pixelForCoordinate(
      Point(
        coordinates: Position(
          mockCar.coordinates.longitude,
          mockCar.coordinates.latitude,
        ),
      ),
    );

    if (!context.mounted) return null;

    final overlay = OverlayEntry(
      builder: (ctx) => Positioned(
        left: screenCoord.x - 75,
        top: screenCoord.y - 120,
        child: FadeTransitionOverlay(
          child: Container(
            width: AppDimensions.overlayWidth,
            padding: const EdgeInsets.all(AppDimensions.medium),
            decoration: BoxDecoration(
              color: ctx.theme.surfaceColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: ctx.theme.shadowColor.withOpacity(0.3),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: mockCar.brand.toUpperCase(),
                        style: ctx.themeData.textTheme.headlineMedium?.copyWith(
                          color: ctx.theme.primaryTextColor,
                          fontWeight: AppFonts.weightBold,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(width: AppDimensions.small),
                      ),
                      TextSpan(
                        text: mockCar.model,
                        style: ctx.themeData.textTheme.headlineSmall?.copyWith(
                          color: ctx.theme.primaryTextColor,
                          fontWeight: AppFonts.weightMedium,
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(
                  mockCar.assets.sideView,
                  width: AppDimensions.overlayCarWidth,
                  height: AppDimensions.overlayCarHeight,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: AppDimensions.medium),
              ],
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(overlay);

    Future.delayed(autoHideDuration, () {
      if (overlay.mounted) overlay.remove();
    });

    return overlay;
  }

  static Future<void> pickDate({
    required BuildContext context,
    required ValueChanged<DateTime?> onDatePicked,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Select your date of birth',
    );

    if (picked != null) {
      onDatePicked(picked);
    }
  }

  static Future<void> showBottomSheet({
    required BuildContext context,
    required Widget child,
    String? sheetTitle,
    TextStyle? titleStyle,
    bool useCloseButton = true,
    bool useRootNavigator = false,
    Color barrierColor = kCupertinoModalBarrierColor,
  }) async {
    final sheetBody = Material(
      color: context.theme.backgroundColor,
      borderRadius: const BorderRadius.all(
        Radius.circular(AppDimensions.large),
      ),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.large),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (sheetTitle != null || useCloseButton) ...[
                Row(
                  children: [
                    if (sheetTitle != null)
                      Text(
                        sheetTitle,
                        style: titleStyle ??
                            context.themeData.textTheme.displaySmall?.copyWith(
                              color: context.theme.primaryTextColor,
                            ),
                      ),
                    const Spacer(),
                    if (useCloseButton)
                      VectorButton(
                        onTap: () => Navigator.canPop(context)
                            ? Navigator.pop(context)
                            : throw Exception(),
                        svgAssetPath: AppAssets.arrowRightIcon,
                      ),
                  ],
                ),
                const SizedBox(height: AppDimensions.medium),
              ],
              child,
            ],
          ),
        ),
      ),
    );

    return showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.transparent,
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.large,
            vertical: AppDimensions.extraLarge,
          ),
          child: sheetBody,
        );
      },
    );
  }
}
