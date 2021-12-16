import 'package:intl/intl.dart';

const _currency2Locale = {'KRW': 'ko', 'USD': 'en', 'KZT': 'kk', 'RUB': 'ru'};

// class CurrencyFormatter {
//   static NumberFormat simpleCurrency = NumberFormat.simpleCurrency(locale: "kk_KZ");
//   static NumberFormat simpleCurrencyDecimal = NumberFormat.simpleCurrency(locale: "kk_KZ");
//
//   static NumberFormat noSymbolCurrency = NumberFormat.currency(locale: "kk_KZ", symbol: '');
//
//   static void set(String currency) {
//     if (_currency2Locale.containsKey(currency)) {
//       simpleCurrency = NumberFormat.simpleCurrency(locale: _currency2Locale[currency]);
//       simpleCurrencyDecimal = NumberFormat.simpleCurrency(locale: _currency2Locale[currency]);
//       simpleCurrencyDecimal.minimumFractionDigits=0;
//       noSymbolCurrency = NumberFormat.currency(locale: _currency2Locale[currency], symbol: '');
//     }
//   }
// }

class CurrencyFormatter {
  static NumberFormat simpleCurrency = NumberFormat.simpleCurrency(locale: "en_US");
  static NumberFormat noSymbolCurrency = NumberFormat.currency(locale: "en_US", symbol: '');
  static NumberFormat get(int minimumFractionDigits, [String locale="en_US"]) {
    simpleCurrency = NumberFormat.simpleCurrency(locale:"en_US", name: "", decimalDigits: minimumFractionDigits);
      return simpleCurrency;
  }
}

class DecimalFormatter {
  static NumberFormat simpleDecimal = NumberFormat.decimalPattern("kk_KZ");

  static void set(String currency) {
    if (_currency2Locale.containsKey(currency)) {
      simpleDecimal = NumberFormat.decimalPattern(_currency2Locale[currency]);
    }
  }
}
