import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatToDDMMM() => DateFormat('dd MMM').format(this);
}

String formatDateRange(DateTime? start, DateTime? end) {
  if (start == null || end == null) return '';
  return '${start.formatToDDMMM()} - ${end.formatToDDMMM()} ';
}
