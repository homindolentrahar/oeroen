import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String toMMMyyyy() => DateFormat.yMMM().format(this);

  String toDisplayPeriodDate() => DateFormat.yMMM().format(this);

  String toDisplayDate() =>
      "${DateFormat.Hm().format(this)} • ${DateFormat.yMMMMd().format(this)}";

  String toDisplayDateAlt() =>
      "${DateFormat.Hm().format(this)}, ${DateFormat('dd MMMM yyyy').format(this)}";
}
