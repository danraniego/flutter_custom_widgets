import 'package:c_widgets/core/d_form_field.dart';
import 'package:flutter/material.dart';

class DTextField extends StatelessWidget {

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? validationKey;
  final bool? required;
  final bool? readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffix;
  final OnChangedCallBack? onChanged;

  const DTextField({
    this.controller,
    this.labelText,
    this.hintText,
    this.validationKey,
    this.required = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.suffix,
    this.onChanged,
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
      readOnly: readOnly,
      enabled: !(readOnly == true),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      suffix: suffix,
      onChanged: onChanged,
    );
  }
}

typedef OnChangedCallBack = void Function(String? value);
