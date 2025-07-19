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

    final List<DCountryPhoneCode> countryCodes;
    final DCountryPhoneCode initialCountryCode;
    final TextEditingController controller;
    final String labelText;
    final String? hintText;
    final String? validationKey;
    final bool? required;

    const DPhoneField({
        required this.countryCodes,
        required this.initialCountryCode,
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
            inputType: TextInputType.phone,
            labelText: labelText,
            hintText: hintText,
            validationKey: validationKey,
            validations: [
              ? (required == true) ? DFValidation.required : null,
              DFValidation.phone
            ],
            formatters: [DPhoneFormatter()],
            prefixIcon: InkWell(
              onTap: () {
                print("Fire");
              },
              child: Container(
                  width: initialCountryCode.dialCode.length > 3 ? 100 : 80,
                  padding: EdgeInsets.only(left: 15, right: 5),
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    // color: Colors.green,
                      border: Border(
                          right: BorderSide(
                              color: DColor.inputBorder,  // Border color
                              width: 2.0          // Border width
                          )
                      )
                  ),
                  child: Row(
                    children: [
                      Text(initialCountryCode.dialCode),
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black45),
                      )
                    ],
                  )
              ),
            ),
        );
    }

}
