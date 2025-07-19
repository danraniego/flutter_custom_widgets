import 'package:c_widgets/core/d_form_field.dart';
import 'package:flutter/material.dart';

class DUrlField extends StatelessWidget {

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? validationKey;
  final bool? required;
  final bool? readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const DUrlField({
    this.controller,
    this.labelText,
    this.hintText,
    this.validationKey,
    this.required = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return DFormField(
      controller: controller,
      inputType: TextInputType.url,
      labelText: labelText,
      hintText: hintText,
      validationKey: validationKey,
      validations: [
        ? (required == true) ? DFValidation.required : null,
        DFValidation.url
      ],
      readOnly: readOnly,
      enabled: !(readOnly == true),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }

}
