import 'package:intl/intl.dart';

class TimeFormatter {
  static String getDate(DateTime current) {
    DateFormat formatter = DateFormat('dd MMM, yyyy HH:MM a');
    String formatted = formatter.format(current);
    return formatted;
  }
}
