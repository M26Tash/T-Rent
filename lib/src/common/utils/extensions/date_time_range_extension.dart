import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeRangeExtension on DateTimeRange {
  String formatRange({
    required String locale,
    String pattern = 'dd MMM, h:mm a | y ',
  }) {
    final dateFormat = DateFormat(
      pattern,
      locale
    );
    final startStr = dateFormat.format(start);
    final endStr = dateFormat.format(end);
    return '$startStr - $endStr';
  }
}
