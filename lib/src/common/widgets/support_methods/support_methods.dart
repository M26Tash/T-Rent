// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:t_rent/src/common/constants/app_assets.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/enums/rental_plan.dart';
import 'package:t_rent/src/common/utils/extensions/context_extension.dart';
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
    DateTime? initialDate,
  }) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Select your date of birth',
    );

    if (picked != null) {
      onDatePicked(picked);
    }
  }

  // static Future<void> pickDateRange({
  //   required BuildContext context,
  //   required ValueChanged<DateTimeRange?> onRangePicked,
  //   DateTimeRange? initialRange,
  //   DateTime? firstDate,
  //   DateTime? lastDate,
  //   String? helpText,
  // }) async {
  //   final now = DateTime.now();
  //   final pickedRange = await showDateRangePicker(
  //     context: context,
  //     initialDateRange: initialRange ??
  //         DateTimeRange(
  //           start: now,
  //           end: now.add(
  //             const Duration(
  //               days: 1,
  //             ),
  //           ),
  //         ),
  //     firstDate: firstDate ?? now,
  //     lastDate: lastDate ??
  //         now.add(
  //           const Duration(days: 365),
  //         ),
  //     helpText: helpText ?? 'Select rental period',
  //     saveText: 'Confirm',
  //     builder: (context, child) {
  //       return Theme(
  //         data: ThemeData(
  //           datePickerTheme: DatePickerThemeData(
  //             backgroundColor: context.theme.backgroundColor,
  //             dayBackgroundColor: WidgetStatePropertyAll(
  //               context.theme.primaryColor,
  //             ),
  //             rangePickerShadowColor: context.theme.accentColor,
  //             rangePickerBackgroundColor: context.theme.surfaceColor,
  //             rangeSelectionBackgroundColor:
  //                 context.theme.accentColor.withOpacity(
  //               0.3,
  //             ),
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );

  //   if (pickedRange != null) {
  //     onRangePicked(pickedRange);
  //   }
  // }

  // static Future<void> pickRentalRange({
  //   required BuildContext context,
  //   required RentalPlan planType,
  //   required ValueChanged<DateTimeRange?> onRangePicked,
  // }) async {
  //   final now = DateTime.now();

  //   // Daily & weekly → standard date range picker
  //   if (planType != RentalPlan.hourly) {
  //     final pickedRange = await showDateRangePicker(
  //       context: context,
  //       initialDateRange: DateTimeRange(
  //         start: now,
  //         end: now.add(const Duration(days: 1)),
  //       ),
  //       firstDate: now,
  //       lastDate: now.add(const Duration(days: 365)),
  //       helpText: 'Select rental period',
  //       saveText: 'Confirm',
  //     );

  //     if (pickedRange != null) {
  //       if (planType == RentalPlan.weekly) {
  //         final days = pickedRange.duration.inDays;
  //         if (days % 7 != 0) {
  //           context.showErrorSnackBar(
  //             'Weekly plan must be in full weeks (7 days).',
  //           );
  //           return;
  //         }
  //       }

  //       onRangePicked(pickedRange);
  //     }
  //     return;
  //   }

  //   // Hourly plan → date + time pickers
  //   final selectedDate = await showDatePicker(
  //     context: context,
  //     initialDate: now,
  //     firstDate: now,
  //     lastDate: now.add(const Duration(days: 30)),
  //     helpText: 'Select rental date',
  //   );

  //   if (selectedDate == null) return;

  //   final startTime = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.fromDateTime(now),
  //     helpText: 'Select start time',
  //   );
  //   if (startTime == null) return;

  //   final endTime = await showTimePicker(
  //     context: context,
  //     initialTime: startTime.replacing(hour: startTime.hour + 1),
  //     helpText: 'Select end time',
  //   );
  //   if (endTime == null) return;

  //   final startDateTime = DateTime(
  //     selectedDate.year,
  //     selectedDate.month,
  //     selectedDate.day,
  //     startTime.hour,
  //     startTime.minute,
  //   );

  //   final endDateTime = DateTime(
  //     selectedDate.year,
  //     selectedDate.month,
  //     selectedDate.day,
  //     endTime.hour,
  //     endTime.minute,
  //   );

  //   final duration = endDateTime.difference(startDateTime);

  //   if (duration.inHours > 24) {
  //     await context.showErrorSnackBar(
  //       'Hourly rentals cannot exceed 24 hours.',
  //     );
  //     return;
  //   }

  //   onRangePicked(DateTimeRange(start: startDateTime, end: endDateTime));
  // }

  static Future<void> pickRentalRange({
    required BuildContext context,
    required RentalPlan planType,
    required ValueChanged<DateTimeRange?> onRangePicked,
  }) async {
    final now = DateTime.now();

    // Daily & weekly → standard date range picker
    if (planType != RentalPlan.hourly) {
      final pickedRange = await showDateRangePicker(
        context: context,
        initialDateRange: DateTimeRange(
          start: now,
          end: now.add(const Duration(days: 1)),
        ),
        firstDate: now,
        lastDate: now.add(const Duration(days: 365)),
        helpText: 'Select rental period',
        saveText: 'Confirm',
      );

      if (!context.mounted) return;

      if (pickedRange != null) {
        if (planType == RentalPlan.weekly) {
          final days = pickedRange.duration.inDays;
          if (days % 7 != 0) {
            context.showErrorSnackBar(
              'Weekly plan must be in full weeks (7 days).',
            );
            return;
          }
        }

        onRangePicked(pickedRange);
      }
      return;
    }

    // Hourly plan → date + time pickers
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 30)),
      helpText: 'Select rental date',
    );

    if (selectedDate == null || !context.mounted) return;

    final startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
      helpText: 'Select start time',
    );
    if (startTime == null || !context.mounted) return;

    final endTime = await showTimePicker(
      context: context,
      initialTime: startTime.replacing(hour: startTime.hour + 1),
      helpText: 'Select end time',
    );
    if (endTime == null || !context.mounted) return;

    final startDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      startTime.hour,
      startTime.minute,
    );

    final endDateTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      endTime.hour,
      endTime.minute,
    );

    final duration = endDateTime.difference(startDateTime);

    if (duration.inHours > 24) {
      if (!context.mounted) return;
      await context.showErrorSnackBar(
        'Hourly rentals cannot exceed 24 hours.',
      );
      return;
    }

    if (!context.mounted) return;
    onRangePicked(DateTimeRange(start: startDateTime, end: endDateTime));
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
