// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/mock/mock_car_list.dart';

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
}

class FadeTransitionOverlay extends StatefulWidget {
  final Widget child;
  const FadeTransitionOverlay({
    required this.child,
    super.key,
  });

  @override
  State<FadeTransitionOverlay> createState() => _FadeTransitionOverlayState();
}

class _FadeTransitionOverlayState extends State<FadeTransitionOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    )..forward();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: widget.child,
    );
  }
}
