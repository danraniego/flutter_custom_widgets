import 'package:c_widgets/core/d_form_field.dart';
import 'package:flutter/material.dart';

class DTextField extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final String? validationKey;
  final bool? required;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const DTextField({
    required this.controller,
    required this.labelText,
    this.hintText,
    this.validationKey,
    this.required = false,
    this.prefixIcon,
    this.suffixIcon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return DFormField(
      controller: controller,
      inputType: TextInputType.text,
      labelText: labelText,
      hintText: hintText,
      validationKey: validationKey,
      validations: [
        ? (required == true) ? DFValidation.required : null,
      ],
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

}
