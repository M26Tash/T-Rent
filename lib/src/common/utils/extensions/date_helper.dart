extension DateHelper on DateTime {
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool isInRanges(DateTime start, DateTime end) =>
      (isAfter(start) || isSameDay(start)) && 
      (isBefore(end) || isSameDay(end));

  DateTime get firstDayOfMonth => DateTime(year, month);
  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);
}
