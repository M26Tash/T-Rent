import 'package:intl/intl.dart';

class CurrencyFormatter {
  static String format(
    num amount,
  ) {
    final format = NumberFormat.currency(
      symbol: '₺',
      decimalDigits: 1,
    );

    return format.format(amount);
  }
}
