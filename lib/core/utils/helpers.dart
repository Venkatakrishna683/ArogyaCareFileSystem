import 'package:intl/intl.dart';

class Helpers {
  static String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  // Duplicate check kosam - photo hash laaga pani chesthundi
  static String generateHash(String input) {
    return input.hashCode.toString();
  }
}