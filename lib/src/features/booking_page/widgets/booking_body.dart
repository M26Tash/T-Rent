import 'package:flutter/material.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/features/booking_page/widgets/booking_overview.dart';
import 'package:t_rent/src/features/booking_page/widgets/custom_calendar_widgets/month_widget.dart';

class BookingBody extends StatelessWidget {
  final List<DateTime> months;
  final DateTime? selectedStart;
  final DateTime? selectedEnd;
  final ValueChanged<DateTime> onDayTap;
  final VoidCallback onHomePageTap;

  const BookingBody({
    required this.months,
    required this.selectedStart,
    required this.selectedEnd,
    required this.onDayTap,
    required this.onHomePageTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (selectedStart != null)
          BookingOverview(
            selectedStart: selectedStart,
            selectedEnd: selectedEnd,
          ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(bottom: AppDimensions.extraLarge),
            itemCount: months.length,
            itemBuilder: (context, index) {
              return MonthWidget(
                month: months[index],
                selectedStart: selectedStart,
                selectedEnd: selectedEnd,
                onDayTap: onDayTap,
              );
            },
          ),
        ),
      ],
    );
  }
}
