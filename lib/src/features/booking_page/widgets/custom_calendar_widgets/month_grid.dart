import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/features/booking_page/widgets/custom_calendar_widgets/day_cell.dart';

class MonthGrid extends StatelessWidget {
  final List<DateTime> days;
  final DateTime month;
  final DateTime? selectedStart;
  final DateTime? selectedEnd;
  final List<DateTimeRange> bookedRanges;
  final ValueChanged<DateTime> onDayTap;

  const MonthGrid({
    required this.days,
    required this.month,
    required this.selectedStart,
    required this.selectedEnd,
    required this.bookedRanges,
    required this.onDayTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.small),
      itemCount: days.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: AppDimensions.small,
        crossAxisSpacing: AppDimensions.small,
      ),
      itemBuilder: (context, index) {
        return DayCell(
          date: days[index],
          month: month,
          selectedStart: selectedStart,
          selectedEnd: selectedEnd,
          bookedRanges: bookedRanges,
          onTap: onDayTap,
        );
      },
    );
  }
}
