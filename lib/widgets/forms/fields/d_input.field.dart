import 'package:c_widgets/constants/dbutton.type.dart';
import 'package:c_widgets/widgets/buttons/d_icon.button.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_address.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_email.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_number.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_password.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_phone.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_text.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_textarea.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_url.field.dart';
import 'package:flutter/cupertino.dart';

enum DInputType {
    text('Text'),
    password('Password'),
    phone('Phone'),
    email('Email'),
    url('URL'),
    address('Address'),
    textarea('Textarea'),
    search('Search'),
    number('Number');

    final String label;

    const DInputType(this.label);
}

class PhoneOptions {
    final List<DCountryPhoneCode>? countryCodes;
    final String? initialCountryCode;

    const PhoneOptions({
        this.countryCodes = const[],
        this.initialCountryCode
    });
}

class DInputPrefixButton extends StatelessWidget {

    final IconData icon;
    final VoidCallback? onPressed;

    const DInputPrefixButton({
        required this.icon,
        this.onPressed,
        super.key
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            margin: EdgeInsets.only(right: 10, top: 5, bottom: 5),
            child: DIconButton(
                width: 25,
                height: 25,
                type: DButtonType.elevated,
                color: DButtonColor.primary,
                icon: icon,
                onPressed: () {

                }
            )
        );
    }

}

class DInputField extends StatelessWidget {

    final TextEditingController? controller;
    final DInputType inputType;
    final String? labelText;
    final String? hintText;
    final String? validationKey;
    final bool? required;
    final bool? readOnly;
    final IconData? leftIcon;
    final IconData? rightIcon;
    final Widget? suffix;
    final String? countryCode;
    final VoidCallback? onPrefixTap;
    final OnChangedCallBack? onChanged;

    const DInputField({
        this.controller,
        this.inputType = DInputType.text,
        this.labelText,
        this.hintText,
        this.validationKey,
        this.required = false,
        this.readOnly = false,
        this.leftIcon,
        this.rightIcon,
        this.suffix,
        this.countryCode,
        this.onPrefixTap,
        this.onChanged,
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
                    suffixIcon: rightIcon,
                    suffix: suffix,
                    onChanged: onChanged
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
                    suffixIcon: rightIcon,
                    suffix: suffix,
                    onChanged: onChanged
                );
            case DInputType.phone:
                return DPhoneField(
                    controller: controller,
                    labelText: labelText,
                    validationKey: validationKey,
                    required: required,
                    readOnly: readOnly,
                    suffixIcon: rightIcon,
                    countryCode: countryCode,
                    onCountryCodeTap: onPrefixTap,
                    suffix: suffix,
                    onChanged: onChanged
                );
            case DInputType.password:
                return DPasswordField(
                    controller: controller,
                    labelText: labelText,
                    hintText: hintText,
                    validationKey: validationKey,
                    required: required,
                    readOnly: readOnly,
                    prefixIcon: leftIcon,
                    onChanged: onChanged
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
                    suffixIcon: rightIcon,
                    suffix: suffix,
                    onChanged: onChanged
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
                    suffixIcon: rightIcon,
                    suffix: suffix,
                    onChanged: onChanged
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
                    suffixIcon: rightIcon,
                    suffix: suffix,
                    onChanged: onChanged
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
                    suffixIcon: rightIcon,
                    suffix: suffix,
                    onChanged: onChanged
                );
            case DInputType.search:
                return DTextField(
                    controller: controller,
                    labelText: labelText,
                    hintText: hintText,
                    readOnly: readOnly,
                    prefixIcon: CupertinoIcons.search,
                    suffixIcon: rightIcon,
                    suffix: suffix,
                    onChanged: onChanged
                );
        }
    }
}

typedef OnChangedCallBack = void Function(String? value);
