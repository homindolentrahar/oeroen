import 'package:intl/intl.dart';

extension DoubleExtensions on double {
  String toCurrency() {
    return NumberFormat.currency(
      locale: "eu",
      symbol: '',
      decimalDigits: 0,
    ).format(this);
  }
}
