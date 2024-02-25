import 'package:easy_localization/easy_localization.dart';

class DateFormatter {
  static final DateFormat formatter = DateFormat('dd-MM-yyyy');

  static String format(DateTime date) {
    return formatter.format(date);
  }
}
