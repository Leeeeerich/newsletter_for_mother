import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0);
}

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll('#', '');

  if (hexColor.length == 6) {
    hexColor = 'FF' + hexColor;
  }

  return Color(int.parse(hexColor, radix: 16));
}

String getAgeYearsMonths(BuildContext ctx, DateTime dateTime) {
  //TODO Not the best solution, but we don't need precision here. Correct accuracy.
  var buf = StringBuffer();
  var dur = DateTime.now().difference(dateTime);

  var years = dur.inDays ~/ 365;
  if (years > 0) {
    buf.write(years);
    buf.write(FlutterI18n.translate(ctx, "short_year"));
  }

  int months = ((dur.inDays - (years * 365)) ~/ 30);
  if (months > 0) {
    buf.write(" ");
    buf.write(months);
    buf.write(FlutterI18n.translate(ctx, "short_month"));
  }

  return buf.toString();
}

String getAgeWeeks(BuildContext ctx, DateTime date) {
  //TODO Not the best solution, but we don't need precision here. Correct accuracy.

  var dur = DateTime.now().difference(date);
  var months = dur.inDays ~/ 30;
  var weeks = (dur.inDays - (months * 30)) ~/ 7;

  return weeks.toString() + FlutterI18n.translate(ctx, "short_week");
}
