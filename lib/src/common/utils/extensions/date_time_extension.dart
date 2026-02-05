import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatMMMDD() => DateFormat('MMM dd, h:mm a').format(this);
}

String formatDateRange(DateTime? start, DateTime? end) {
  if (start == null || end == null) return '';
  return '${start.formatMMMDD()} - ${end.formatMMMDD()} ';
}
