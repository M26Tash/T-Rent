import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String formatFullDate() => DateFormat('MMM dd, h:mm a').format(this);
  String formatDate() => DateFormat('MMMM d').format(this);
  String formatTime() => DateFormat('h:mm a').format(this);
}

String formatDateRange(DateTime? start, DateTime? end) {
  if (start == null || end == null) return '';
  return '${start.formatFullDate()}\n${end.formatFullDate()}';
}
