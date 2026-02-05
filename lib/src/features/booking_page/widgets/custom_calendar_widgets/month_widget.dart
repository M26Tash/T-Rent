import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/cubit_scope/cubit_scope.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/extensions/string_extension.dart';
import 'package:t_rent/src/features/booking_page/cubit/booking_cubit.dart';
import 'package:t_rent/src/features/booking_page/widgets/custom_calendar_widgets/month_grid.dart';
import 'package:t_rent/src/features/booking_page/widgets/custom_calendar_widgets/week_days_row.dart';

class MonthWidget extends StatelessWidget {
  final DateTime month;
  final DateTime? selectedStart;
  final DateTime? selectedEnd;
  final ValueChanged<DateTime> onDayTap;

  const MonthWidget({
    required this.month,
    required this.selectedStart,
    required this.selectedEnd,
    required this.onDayTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bookingCubit = CubitScope.of<BookingCubit>(context);
    final days = bookingCubit.generateMonthGrid(month);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _MonthHeader(month: month),
        const WeekDaysRow(),
        const SizedBox(height: AppDimensions.medium),
        MonthGrid(
          days: days,
          month: month,
          selectedStart: selectedStart,
          selectedEnd: selectedEnd,
          onDayTap: onDayTap,
        ),
        const SizedBox(height: AppDimensions.extraLarge),
      ],
    );
  }
}

class _MonthHeader extends StatelessWidget {
  final DateTime month;

  const _MonthHeader({required this.month});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.large),
      child: Text(
        DateFormat.yMMMM(context.locale.localeName).format(month).capitalize(),
        style: context.themeData.textTheme.headlineLarge?.copyWith(
          color: context.theme.primaryTextColor,
          fontWeight: AppFonts.weightBold,
        ),
      ),
    );
  }
}
