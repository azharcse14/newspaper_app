import 'package:intl/intl.dart';

class DateTimeUtils {
  static String formatDateTime(DateTime dateTime) {
    return DateFormat('dd MMM yyyy hh:mm').format(dateTime);
  }

  static String formatDate(DateTime dateTime) {
    return DateFormat('dd,MM,yyyy').format(dateTime);
  }
}
