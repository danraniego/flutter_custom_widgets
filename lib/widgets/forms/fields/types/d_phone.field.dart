import 'package:c_widgets/config/dconfig.dart';
import 'package:c_widgets/core/d_form_field.dart';
import 'package:c_widgets/widgets/forms/formatters/d_phone.formatter.dart';
import 'package:flutter/material.dart';

class DCountryPhoneCode {
    final String key;
    final String name;
    final String dialCode;

    DCountryPhoneCode({
        required this.key,
        required this.name,
        required this.dialCode
    });

    factory DCountryPhoneCode.fromJson(Map<String, dynamic> j) {
        return DCountryPhoneCode(
            key: j['code'] as String,
            name: j['name'] as String,
            dialCode: j['dial_code'].replaceAll(' ', '')
        );
    }
}

class DPhoneField extends StatelessWidget {

    final TextEditingController? controller;
    final String? labelText;
    final List<DCountryPhoneCode>? countryCodes;
    final DCountryPhoneCode? initialCountryCode;
    final String? hintText;
    final String? validationKey;
    final bool? required;
    final bool? readOnly;
    final IconData? suffixIcon;
    final VoidCallback? onCountryCodeTap;

    const DPhoneField({
        this.controller,
        this.labelText,
        this.countryCodes,
        this.initialCountryCode,
        this.hintText,
        this.validationKey,
        this.required = false,
        this.readOnly = false,
        this.suffixIcon,
        this.onCountryCodeTap,
        super.key
    });

    @override
    Widget build(BuildContext context) {
        return DFormField(
            controller: controller,
            inputType: TextInputType.phone,
            labelText: labelText,
            hintText: hintText,
            validationKey: validationKey,
            validations: [
                ? (required == true) ? DFValidation.required : null,
                DFValidation.phone
            ],
            formatters: [DPhoneFormatter()],
            readOnly: readOnly,
            enabled: readOnly == false,
            suffixIcon: suffixIcon,
            prefix: initialCountryCode != null && readOnly == false ? InkWell(
                    onTap: countryCodes!.isEmpty ? null : onCountryCodeTap,
                    child: Container(
                        width: initialCountryCode!.dialCode.length > 3 ? 80 : 60 - (countryCodes!.isEmpty ? 15 : 0),
                        margin: EdgeInsets.only(right: 15),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    color: DColor.inputBorder,  // Border color
                                    width: 2.0 // Border width
                                )
                            )
                        ),
                        child: Row(
                            children: [
                                Text(initialCountryCode?.dialCode ?? ''),
                                if (countryCodes!.isNotEmpty) Container(
                                    // color: Colors.red,
                                    padding: EdgeInsets.only(left: 5),
                                    child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black45)
                                )
                            ]
                        )
                    )
                ) : null
        );
    }

}
