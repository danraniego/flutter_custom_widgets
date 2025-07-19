import 'package:c_widgets/core/d_form_field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_address.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_email.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_number.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_phone.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_text.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_textarea.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_url.field.dart';
import 'package:flutter/material.dart';

enum DInputType {
    text('Text'),
    phone('Phone'),
    email('Email'),
    url('URL'),
    address('Address'),
    textarea('Textarea'),
    number('Number');

    final String label;

    const DInputType(this.label);
}

class PhoneOptions {
    final List<DCountryPhoneCode>? countryCodes;
    final DCountryPhoneCode? initialCountryCode;

    const PhoneOptions({
        this.countryCodes = const[],
        this.initialCountryCode
    });
}

class DInputField extends StatelessWidget {

    final TextEditingController controller;
    final DInputType inputType;
    final String labelText;
    final String? hintText;
    final String? validationKey;
    final bool? required;
    final bool? readOnly;
    final IconData? leftIcon;
    final IconData? rightIcon;
    final PhoneOptions? options;

    const DInputField({
        required this.controller,
        this.inputType = DInputType.text,
        required this.labelText,
        this.hintText,
        this.validationKey,
        this.required = false,
        this.readOnly = false,
        this.leftIcon,
        this.rightIcon,
        this.options,
        super.key
    });

    @override
    Widget build(BuildContext context) {
        switch (inputType) {
            case DInputType.text:
                return DTextField(
                    controller: controller,
                    labelText: labelText,
                    hintText: hintText,
                    validationKey: validationKey,
                    required: required,
                    readOnly: readOnly,
                    prefixIcon: leftIcon,
                    suffixIcon: rightIcon
                );
            case DInputType.phone:
                return DPhoneField(
                    controller: controller,
                    labelText: labelText,
                    validationKey: validationKey,
                    required: required,
                    readOnly: readOnly,
                    suffixIcon: rightIcon,
                    countryCodes: options?.countryCodes,
                    initialCountryCode: options?.initialCountryCode
                );
            case DInputType.email:
                return DEmailField(
                    controller: controller,
                    labelText: labelText,
                    hintText: hintText,
                    validationKey: validationKey,
                    required: required,
                    readOnly: readOnly,
                    prefixIcon: leftIcon,
                    suffixIcon: rightIcon
                );
            case DInputType.url:
                return DUrlField(
                    controller: controller,
                    labelText: labelText,
                    hintText: hintText,
                    validationKey: validationKey,
                    required: required,
                    readOnly: readOnly,
                    prefixIcon: leftIcon,
                    suffixIcon: rightIcon
                );
            case DInputType.number:
              return DNumberField(
                  controller: controller,
                  labelText: labelText,
                  hintText: hintText,
                  validationKey: validationKey,
                  required: required,
                  readOnly: readOnly,
                  prefixIcon: leftIcon,
                  suffixIcon: rightIcon
              );
            case DInputType.address:
                return DAddressField(
                    controller: controller,
                    labelText: labelText,
                    hintText: hintText,
                    validationKey: validationKey,
                    required: required,
                    readOnly: readOnly,
                    prefixIcon: leftIcon,
                    suffixIcon: rightIcon
                );
            case DInputType.textarea:
                return DTextAreaField(
                    controller: controller,
                    labelText: labelText,
                    hintText: hintText,
                    validationKey: validationKey,
                    required: required,
                    readOnly: readOnly,
                    prefixIcon: leftIcon,
                    suffixIcon: rightIcon
                );
        }
    }
}
