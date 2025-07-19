import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DNumberFormatter extends TextInputFormatter {
  final int decimal;

  DNumberFormatter({this.decimal = 2});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(',', '');

    if (text.isEmpty || text == '.') {
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }

    final regExp = RegExp(r'^\d*\.?\d{0,' + decimal.toString() + r'}$');
    if (!regExp.hasMatch(text)) return oldValue;

    final parts = text.split('.');
    String formatted = NumberFormat.decimalPattern().format(int.parse(parts[0]));

    if (parts.length > 1) {
      formatted += '.${parts[1]}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
