import 'package:intl/intl.dart';

String formatNumberWithSeparator(int number) {
  final format = NumberFormat("#,###");
  String str = format.format(number);
  str = str.replaceAll(",", ".");
  return str;
}