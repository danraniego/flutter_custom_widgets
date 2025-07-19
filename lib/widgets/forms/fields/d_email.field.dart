import 'package:c_widgets/core/d_form_field.dart';
import 'package:flutter/material.dart';

class DEmailField extends StatelessWidget {

  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final String? validationKey;
  final bool? required;

  const DEmailField({
    required this.controller,
    required this.labelText,
    this.hintText,
    this.validationKey,
    this.required = false,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return DFormField(
      controller: controller,
      inputType: TextInputType.emailAddress,
      labelText: labelText,
      hintText: hintText,
      validationKey: validationKey,
      validations: [
        ? (required == true) ? DFValidation.required : null,
        DFValidation.email
      ],
    );
  }

}
