import 'package:flutter/services.dart';

class AddressInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (oldValue.text.length > newValue.text.length) {
      int dashCount = RegExp(r'-').allMatches(newValue.text).length;
      if (dashCount > 1 &&
          oldValue.text.endsWith(' -') &&
          !newValue.text.endsWith(' -')) {
        return TextEditingValue(
          text: newValue.text
              .replaceRange(newValue.text.length - 1, newValue.text.length, ''),
          selection: TextSelection.collapsed(
            offset: newValue.text.length,
          ),
        );
      }
    } else {
      if (newValue.text.isNotEmpty &&
          newValue.text.endsWith(' ') &&
          oldValue.text != newValue.text) {
        int dashCount = RegExp(r'-').allMatches(newValue.text).length;
        if (dashCount < 2) {
          return TextEditingValue(
            text: '${newValue.text} - ',
            selection: TextSelection.collapsed(
              offset: newValue.text.length + 3,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
