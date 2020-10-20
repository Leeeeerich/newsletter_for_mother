import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String dateToString() {
    return DateFormat('dd MMM yyyy').format(this);
  }
}
