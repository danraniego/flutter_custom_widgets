import 'package:flutter/services.dart';

class DTinFormatter extends TextInputFormatter {
    const DTinFormatter();

    @override
    TextEditingValue formatEditUpdate(TextEditingValue oldValue,TextEditingValue newValue) {
        final digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
        final buffer = StringBuffer();

        for (int i = 0; i < digitsOnly.length && i < 12; i++) {
            if (i == 3 || i == 6 || i == 9) {
                buffer.write('-');
            }
            buffer.write(digitsOnly[i]);
        }

        return TextEditingValue(
            text: buffer.toString(),
            selection: TextSelection.collapsed(offset: buffer.length)
        );
    }
}
