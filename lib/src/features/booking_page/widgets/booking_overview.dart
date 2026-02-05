import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/extensions/date_time_extension.dart';

class BookingOverview extends StatelessWidget {
  final DateTime? selectedStart;
  final DateTime? selectedEnd;

  const BookingOverview({
    required this.selectedStart,
    required this.selectedEnd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.large),
      decoration: BoxDecoration(
        color: context.theme.accentColor.withValues(alpha: 0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pick-Up',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
              Text(
                '${selectedStart?.formatMMMDD()}',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.accentTextColor,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Return',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.primaryTextColor,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
              Text(
                selectedEnd?.formatMMMDD() ?? 'Not picked yet',
                style: context.themeData.textTheme.headlineMedium?.copyWith(
                  color: context.theme.accentTextColor,
                  fontWeight: AppFonts.weightBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
