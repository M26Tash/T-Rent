import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:t_rent/src/common/constants/app_dimensions.dart';
import 'package:t_rent/src/common/constants/app_fonts.dart';
import 'package:t_rent/src/common/localization/localizations_ext.dart';
import 'package:t_rent/src/common/theme/theme_extension.dart';
import 'package:t_rent/src/common/utils/extensions/string_extension.dart';

class WeekDaysRow extends StatelessWidget {
  const WeekDaysRow({super.key});

  @override
  Widget build(BuildContext context) {
    final weekdayNames = _getLocalizedWeekdays(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.medium,
      ),
      child: Row(
        children: weekdayNames
            .map(
              (day) => Expanded(
                child: Center(
                  child: Text(
                    day.capitalize(),
                    style: context.themeData.textTheme.headlineSmall?.copyWith(
                      color: context.theme.secondaryTextColor,
                      fontWeight: AppFonts.weightSemiBold,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  List<String> _getLocalizedWeekdays(BuildContext context) {
    final formatter = DateFormat.E(context.locale.localeName);

    return List.generate(7, (index) {
      final date = DateTime(2024, 1, index + 1);
      return formatter.format(date);
    });
  }
}
