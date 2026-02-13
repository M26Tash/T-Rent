import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String format() {
    final format = NumberFormat.currency(symbol: '', decimalDigits: 0);

    return '${format.format(this)} KM';
  }
}
