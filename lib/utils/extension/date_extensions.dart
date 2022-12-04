import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String toMMMyyyy() => DateFormat.yMMM().format(this);

  String toDisplayDate() =>
      "${DateFormat.Hm().format(this)} • ${DateFormat.yMMMMd().format(this)}";
}
