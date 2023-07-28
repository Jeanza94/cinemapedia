
import 'package:intl/intl.dart';

class HumanFormats {

  static String number(double num, [int decimals = 0]) {
    
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
      symbol: '',
      locale: 'en'
    ).format(num);

    return formattedNumber;
  }
}