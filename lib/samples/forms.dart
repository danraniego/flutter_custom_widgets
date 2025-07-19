import 'package:c_widgets/appbar.dart';
import 'package:c_widgets/item_container.dart';
import 'package:c_widgets/item_row.dart';
import 'package:c_widgets/widgets/buttons/do.button.dart';
import 'package:c_widgets/widgets/forms/checkbox/d_list_tile.checkbox.dart';
import 'package:c_widgets/widgets/forms/fields/d_input.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_phone.field.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {

    const Forms({super.key});

    @override
    State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
    final _formKey = GlobalKey<FormState>();

    var controller = TextEditingController();

    List<DInputType> inputTypes = [
        DInputType.text,
        DInputType.phone,
        DInputType.email,
        DInputType.url,
        DInputType.number,
        DInputType.address,
        DInputType.textarea
    ];
    var fieldType = DInputType.text;

    var required = true;
    var readOnly = false;
    var hintText = "Ex. Dean";

    IconData? leftIcon;
    IconData? rightIcon;

    DCountryPhoneCode initialPhoneCode = DCountryPhoneCode(
        key: 'PH',
        name: 'PH',
        dialCode: '+63'
    );

    getHintText() {
        switch (fieldType) {
            case DInputType.text:
                return "Ex. Dean";
            case DInputType.phone:
                return "Ex. +63 912 345 6789";
            case DInputType.email:
                return "Ex. dean@company.com";
            case DInputType.number:
                return "Ex. 12345.67";
            case DInputType.url:
                return "Ex. https://www.example.com";
            case DInputType.address:
                return "Ex. 123 Main St, City, Country";
            case DInputType.textarea:
                return "Ex. Write your message here...";
        }
    }

    setLeftIcon(value) {
        setState(() {
                if (value) {
                    switch (fieldType) {
                        case DInputType.text:
                            leftIcon = Icons.text_fields;
                            break;
                        case DInputType.phone:
                            leftIcon = Icons.phone;
                            break;
                        case DInputType.email:
                            leftIcon = Icons.email;
                            break;
                        case DInputType.number:
                            leftIcon = Icons.numbers;
                            break;
                        case DInputType.url:
                            leftIcon = Icons.link;
                            break;
                        case DInputType.address:
                            leftIcon = Icons.location_on;
                            break;
                        case DInputType.textarea:
                            leftIcon = Icons.text_format;
                            break;
                    }
                } else {
                    leftIcon = null;
                }
            });
    }

    setRightIcon(value) {
        setState(() {
                if (value) {
                    switch (fieldType) {
                        case DInputType.text:
                            rightIcon = Icons.text_fields;
                            break;
                        case DInputType.phone:
                            rightIcon = Icons.phone;
                            break;
                        case DInputType.email:
                            rightIcon = Icons.email;
                            break;
                        case DInputType.number:
                            rightIcon = Icons.numbers;
                            break;
                        case DInputType.url:
                            rightIcon = Icons.link;
                            break;
                        case DInputType.address:
                            rightIcon = Icons.location_on;
                            break;
                        case DInputType.textarea:
                            rightIcon = Icons.text_format;
                            break;
                    }
                } else {
                    rightIcon = null;
                }
            });
    }

    String getLeftStringIcon() {
      switch (leftIcon) {
        case Icons.text_fields:
          return "Icons.text_fields";
        case Icons.phone:
          return "Icons.phone";
        case Icons.email:
          return "Icons.email";
        case Icons.numbers:
          return "Icons.numbers";
        case Icons.link:
          return "Icons.link";
        case Icons.location_on:
          return "Icons.location_on";
        case Icons.text_format:
          return "Icons.text_format";
        default:
          return "null";
      }
    }

    String getRightStringIcon() {
      switch (rightIcon) {
        case Icons.text_fields:
          return "Icons.text_fields";
        case Icons.phone:
          return "Icons.phone";
        case Icons.email:
          return "Icons.email";
        case Icons.numbers:
          return "Icons.numbers";
        case Icons.link:
          return "Icons.link";
        case Icons.location_on:
          return "Icons.location_on";
        case Icons.text_format:
          return "Icons.text_format";
        default:
          return "null";
      }
    }

    getOptions() {
        if (fieldType == DInputType.phone) {
            return 'PhoneOptions(\n'
                '         countryCodes: [],  // Supply Country Codes here \n'
                '         initialCountryCode: DCountryPhoneCode(\n'
                '             key: "PH",\n'
                '             name: "PH",\n'
                '             dialCode: "+63"\n'
                '         )\n'
                '     )';
        }
        return null;
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Forms")
            ),
            drawer: SideDrawer(),
            body: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUnfocus,
                child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                        ItemRow(
                            title: "Input Fields",
                            children: [
                                ItemContainer(
                                    code: 'DInputField(\n'
                                    '     controller: controller,\n'
                                    '     labelText: "Enter ${fieldType.label}",\n'
                                    '     hintText: ${getHintText()},\n'
                                    '     required: $required,\n'
                                    '     readOnly: $readOnly,\n'
                                    '     validationKey: "${fieldType.label}",\n'
                                    '     inputType: $fieldType,\n'
                                    '     leftIcon: ${getLeftStringIcon()},\n'
                                    '     rightIcon: ${getRightStringIcon()},\n'
                                    '     options: ${getOptions()}\n'
                                    ')',
                                    child: DInputField(
                                        controller: controller,
                                        labelText: "Enter ${fieldType.label}",
                                        hintText: getHintText(),
                                        required: required,
                                        readOnly: readOnly,
                                        validationKey: fieldType.label,
                                        inputType: fieldType,
                                        leftIcon: leftIcon,
                                        rightIcon: rightIcon,
                                        options: fieldType == DInputType.phone
                                            ? PhoneOptions(
                                                countryCodes: [],
                                                initialCountryCode: initialPhoneCode
                                            ) : null
                                    )
                                ),
                                Column(
                                    children: [
                                        Row(
                                            children: [
                                                for (final type in inputTypes)
                                                    ...[
                                                        Expanded(
                                                            child: DOButton(
                                                                text: type.label,
                                                                type: DOButtonType.primary,
                                                                onPressed: () {
                                                                    setState(() {
                                                                            fieldType = type;
                                                                        });
                                                                    setLeftIcon(leftIcon != null);
                                                                    setRightIcon(rightIcon != null);
                                                                }
                                                            )
                                                        ),
                                                        const SizedBox(width: 20)
                                                    ]
                                            ]
                                        ),
                                        const SizedBox(height: 10),
                                        DListTileCheckBox(
                                            title: "Required",
                                            value: required,
                                            onChanged: (bool? value) {
                                                setState(() {
                                                        required = value ?? false;
                                                    });
                                            }
                                        ),
                                        DListTileCheckBox(
                                            title: "Read Only",
                                            value: readOnly,
                                            onChanged: (bool? value) {
                                                setState(() {
                                                        readOnly = value ?? false;
                                                    });
                                            }
                                        ),
                                        DListTileCheckBox(
                                            title: "Left Icon",
                                            value: leftIcon == null ? false : true,
                                            enabled: fieldType != DInputType.phone,
                                            onChanged: (bool? value) {
                                                setLeftIcon(value);
                                            }
                                        ),
                                        DListTileCheckBox(
                                            title: "Right Icon",
                                            value: rightIcon == null ? false : true,
                                            onChanged: (bool? value) {
                                                setRightIcon(value);
                                            }
                                        )
                                    ]
                                )
                            ]
                        )
                    ]
                )
            )
        );
    }
}
