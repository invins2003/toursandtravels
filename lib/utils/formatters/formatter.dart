// formatter.dart
import 'package:intl/intl.dart';

class Formatter {
  Formatter._();

  // Date Formatter
  static String formatDate(DateTime date, {String pattern = 'yyyy-MM-dd'}) {
    final DateFormat formatter = DateFormat(pattern);
    return formatter.format(date);
  }

  // Currency Formatter
  static String formatCurrency(double amount, {String locale = 'en_US', String symbol = '\$'}) {
    final NumberFormat formatter = NumberFormat.currency(locale: locale, symbol: symbol);
    return formatter.format(amount);
  }

  // Mobile Number Formatter
  static String formatMobileNumber(String number) {
    // Assuming a standard format (e.g., (123) 456-7890 for US numbers)
    String cleaned = number.replaceAll(RegExp(r'\D'), '');
    if (cleaned.length == 10) {
      return '(${cleaned.substring(0, 3)}) ${cleaned.substring(3, 6)}-${cleaned.substring(6)}';
    }
    return number; // Return the original number if it doesn't match the expected length
  }
}
