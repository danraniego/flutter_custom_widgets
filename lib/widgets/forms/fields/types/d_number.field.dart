import 'package:c_widgets/core/d_form_field.dart';
import 'package:c_widgets/widgets/forms/formatters/d_number.formatter.dart';
import 'package:flutter/material.dart';

class DNumberField extends StatelessWidget {

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? validationKey;
  final bool? required;
  final bool? readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int? decimal;

  const DNumberField({
    this.controller,
    this.labelText,
    this.hintText,
    this.validationKey,
    this.required = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.decimal = 2,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return DFormField(
      controller: controller,
      inputType: TextInputType.number,
      labelText: labelText,
      hintText: hintText,
      validationKey: validationKey,
      validations: [
        ? (required == true) ? DFValidation.required : null,
        DFValidation.number
      ],
      formatters: [DNumberFormatter(decimal: decimal!)],
      readOnly: readOnly,
      enabled: !(readOnly == true),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

}
