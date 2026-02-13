import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';

class DayCell extends StatelessWidget {
  final DateTime date;
  final DateTime month;
  final DateTime? selectedStart;
  final DateTime? selectedEnd;
  final ValueChanged<DateTime> onTap;
  final List<DateTimeRange> bookedRanges;

  const DayCell({
    required this.date,
    required this.month,
    required this.selectedStart,
    required this.selectedEnd,
    required this.bookedRanges,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isOutsideMonth = date.month != month.month || date.year != month.year;

    final isBooked = !isOutsideMonth &&
        bookedRanges.any((range) {
          final day = DateTime(date.year, date.month, date.day);
          return (day.isAtSameMomentAs(range.start) ||
                  day.isAfter(range.start)) &&
              (day.isAtSameMomentAs(range.end) || day.isBefore(range.end));
        });

    final isStart = !isOutsideMonth && _isSameDay(date, selectedStart);
    final isEnd = !isOutsideMonth && _isSameDay(date, selectedEnd);
    final isInRange = !isOutsideMonth && _checkIsInRange();

    final bgColor = (isStart || isEnd)
        ? context.theme.primaryColor
        : isInRange
            ? context.theme.accentColor.withValues(alpha: 0.2)
            : null;

    final textColor = (isStart || isEnd)
        ? context.theme.primaryTextColor
        : (isOutsideMonth || isBooked)
            ? context.theme.primaryTextColor.withValues(alpha: 0.25)
            : context.theme.primaryTextColor;

    return GestureDetector(
      onTap: (isOutsideMonth || isBooked) ? null : () => onTap(date),
      child: Container(
        margin: const EdgeInsets.all(AppDimensions.small),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(AppDimensions.medium),
        ),
        alignment: Alignment.center,
        child: Text(
          '${date.day}',
          style: context.themeData.textTheme.titleMedium?.copyWith(
            color: textColor,
            fontWeight: (isStart || isEnd) ? AppFonts.weightBold : null,
          ),
        ),
      ),
    );
  }

  bool _checkIsInRange() {
    if (selectedStart == null || selectedEnd == null) return false;
    return date.isAfter(selectedStart!) && date.isBefore(selectedEnd!);
  }

  bool _isSameDay(DateTime? a, DateTime? b) {
    if (a == null || b == null) return false;
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
