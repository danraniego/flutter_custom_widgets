import 'package:c_widgets/appbar.dart';
import 'package:c_widgets/constants/dbutton.type.dart';
import 'package:c_widgets/item_container.dart';
import 'package:c_widgets/item_row.dart';
import 'package:c_widgets/widgets/buttons/d_group.button.dart';
import 'package:c_widgets/widgets/forms/checkbox/d_list_tile.checkbox.dart';
import 'package:c_widgets/widgets/forms/fields/d_input.field.dart';
import 'package:c_widgets/widgets/forms/fields/types/d_phone.field.dart';
import 'package:c_widgets/widgets/sheets/d_list_picker.sheet.dart';
import 'package:c_widgets/widgets/sheets/dsheet.controller.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {

    const Forms({super.key});

    @override
    State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
    final _formKey = GlobalKey<FormState>();

    var selectedInputType = DInputType.text;

    // Text Field Variables
    var required = false;
    var readOnly = false;
    var withIcon = false;
    var withIconButton = false;
    var withElevatedButton = false;

    IconData? leftIcon = Icons.person;
    Widget? rightIconButton;
    Widget? rightButton;

    var initialPhoneCode = '+63';
    var phoneCodes = <DListPickerItem>[
        DListPickerItem(value: '+63', label: '+63 - Philippines'),
        DListPickerItem(value: '+1', label: '+1 - United States'),
        DListPickerItem(value: '+44', label: '+44 - United Kingdom'),
        DListPickerItem(value: '+61', label: '+61 - Australia'),
        DListPickerItem(value: '+81', label: '+81 - Japan'),
        DListPickerItem(value: '+49', label: '+49 - Germany'),
        DListPickerItem(value: '+33', label: '+33 - France'),
        DListPickerItem(value: '+34', label: '+34 - Spain'),
        DListPickerItem(value: '+39', label: '+39 - Italy'),
        DListPickerItem(value: '+91', label: '+91 - India'),
        DListPickerItem(value: '+86', label: '+86 - China')
    ];

    String getLabelText() {
        switch (selectedInputType) {
            case DInputType.text:
                return 'Enter Name';
            case DInputType.password:
                return 'Enter Password';
            case DInputType.phone:
                return 'Enter Phone Number';
            case DInputType.email:
                return 'Enter Email';
            case DInputType.url:
                return 'Enter URL';
            case DInputType.address:
                return 'Enter Address';
            case DInputType.textarea:
                return 'Enter Description';
            case DInputType.search:
                return 'Search';
            case DInputType.number:
                return 'Enter Number';
        }
    }

    String getHintText() {
        switch (selectedInputType) {
            case DInputType.text:
                return 'Ex. Dean';
            case DInputType.password:
                return 'Ex. Password123';
            case DInputType.phone:
                return 'Ex. +63 912 345 6789';
            case DInputType.email:
                return 'Ex. dean@company.com';
            case DInputType.url:
                return 'Ex. https://www.example.com';
            case DInputType.address:
                return 'Ex. 123 Main St, City, Country';
            case DInputType.textarea:
                return 'Ex. Write your description here...';
            case DInputType.search:
                return 'Ex. Search for something...';
            case DInputType.number:
                return 'Ex. 12345';
        }
    }

    String getValidationKey() {
        switch (selectedInputType) {
            case DInputType.text:
                return 'Name';
            case DInputType.password:
                return 'Password';
            case DInputType.phone:
                return 'Phone';
            case DInputType.email:
                return 'Email';
            case DInputType.url:
                return 'URL';
            case DInputType.address:
                return 'Address';
            case DInputType.textarea:
                return 'Description';
            case DInputType.search:
                return 'Search';
            case DInputType.number:
                return 'Number';
        }
    }

    void setIcon() {
        if (!withIcon) {
            leftIcon = null;
            return;
        }
        switch (selectedInputType) {
            case DInputType.text:
            case DInputType.textarea:
                leftIcon = Icons.text_fields;
                break;
            case DInputType.password:
                leftIcon = Icons.lock;
                break;
            case DInputType.phone:
                leftIcon = Icons.phone;
                break;
            case DInputType.email:
                leftIcon = Icons.email;
                break;
            case DInputType.url:
                leftIcon = Icons.link;
                break;
            case DInputType.address:
                leftIcon = Icons.location_on;
                break;
            case DInputType.search:
                leftIcon = Icons.search;
                break;
            case DInputType.number:
                leftIcon = Icons.numbers;
                break;
        }
    }

    String getFieldIcon() {
        switch (selectedInputType) {
            case DInputType.text:
                return 'Icons.text_fields';
            case DInputType.password:
                return 'Icons.lock';
            case DInputType.phone:
                return 'Icons.phone';
            case DInputType.email:
                return 'Icons.email';
            case DInputType.url:
                return 'Icons.link';
            case DInputType.address:
                return 'Icons.location_on';
            case DInputType.textarea:
                return 'Icons.text_fields';
            case DInputType.search:
                return 'Icons.search';
            case DInputType.number:
                return 'Icons.numbers';
        }
    }

    IconData? getIconData() {
        if (withIcon == false) {
            return null;
        }

        switch (selectedInputType) {
            case DInputType.text:
                return Icons.text_fields;
            case DInputType.password:
                return Icons.lock;
            case DInputType.phone:
                return Icons.phone;
            case DInputType.email:
                return Icons.email;
            case DInputType.url:
                return Icons.link;
            case DInputType.address:
                return Icons.location_on;
            case DInputType.textarea:
                return Icons.text_fields;
            case DInputType.search:
                return Icons.search;
            case DInputType.number:
                return Icons.numbers;
        }
    }

    Widget getWidgetSuffix() {
        switch (selectedInputType) {
            case DInputType.text:
            case DInputType.password:
            case DInputType.phone:
            case DInputType.email:
            case DInputType.url:
            case DInputType.address:
            case DInputType.textarea:
            case DInputType.search:
            case DInputType.number:
                return rightButton ?? rightIconButton ?? SizedBox.shrink();
        }
    }

    String getFieldSuffix() {
        if (rightButton != null) {
            return 'DInputPrefixButton(\n'
            '  icon: Icons.clear,\n'
            '  onPressed: () {\n'
            '    \n'
            '  }\n'
            ')';
        } else if (rightIconButton != null) {
            return 'IconButton(\n'
            '     icon: Icon(Icons.clear),\n'
            '     onPressed: () {\n'
            '       \n'
            '     }\n'
            '   )';
        }
        return '';
    }

    String getOnPrefixTap() {
        return 'onPrefixTap: () async {\n'
            '  if (selectedInputType == DInputType.phone) {\n'
            '    DListPickerOptions options = DListPickerOptions(\n'
            '      title: "Select Country",\n'
            '      items: phoneCodes,\n'
            '      selectedItem: phoneCodes.first,\n'
            '      searchEnabled: true,\n'
            '      autoSubmit: true,\n'
            '      height: MediaQuery.of(context).size.height * 0.8\n'
            '    );\n\n'
            '    var result = await DSheetController.showListPicker(context, options: options);\n\n'
            '    if (result != null) {\n'
            '      setState(() {\n'
            '        initialPhoneCode = result.value ?? \'\';\n'
            '      });\n'
            '    }\n'
            '  }\n'
            '}';
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
                            title: "Text Fields",
                            children: [
                                ItemContainer(
                                    title: "Text Field",
                                    code: 'DInputField(\n'
                                    '  controller: TextEditingController(),\n'
                                    '  labelText: "${getLabelText()}",\n'
                                    '  hintText: "${getHintText()}",\n'
                                    '  inputType: ${selectedInputType.toString()},\n'
                                    '  validationKey: "${getValidationKey()}",\n'
                                    '  required: $required,\n'
                                    '  readOnly: $readOnly,\n'
                                    '  ${leftIcon != null ? 'leftIcon: ${getFieldIcon()},\n' : ''}'
                                    '  ${withIconButton == true || withElevatedButton == true ? 'suffix: ${getFieldSuffix()},\n' : ''}'
                                    '${selectedInputType == DInputType.phone ? 'countryCode: "$initialPhoneCode",\n' : ''}'
                                    '${selectedInputType == DInputType.phone ? getOnPrefixTap() : ''}\n'
                                    ')',
                                    child: DInputField(
                                        controller: TextEditingController(),
                                        labelText: getLabelText(),
                                        hintText: getHintText(),
                                        inputType: selectedInputType,
                                        validationKey: getValidationKey(),
                                        required: required,
                                        readOnly: readOnly,
                                        leftIcon: getIconData(),
                                        suffix: rightButton ?? rightIconButton,
                                        countryCode: initialPhoneCode,
                                        onPrefixTap: () async {
                                            if (selectedInputType == DInputType.phone) {
                                                DListPickerOptions options = DListPickerOptions(
                                                    title: "Select Country Code",
                                                    items: phoneCodes,
                                                    selectedItem: phoneCodes.first,
                                                    searchEnabled: true,
                                                    autoSubmit: true,
                                                    height: MediaQuery.of(context).size.height * 0.8
                                                );

                                                var result = await DSheetController.showListPicker(context, options: options);

                                                if (result != null) {
                                                    setState(() {
                                                        initialPhoneCode = result.value ?? '';
                                                    });
                                                }
                                            }
                                        }
                                    )
                                ),
                                Column(
                                    children: [
                                        DGroupButton(
                                            items: [
                                                DGroupButtonItem(label: 'Text'),
                                                DGroupButtonItem(label: 'Email'),
                                                DGroupButtonItem(label: 'Phone'),
                                                DGroupButtonItem(label: 'Password'),
                                                DGroupButtonItem(label: 'Number'),
                                                DGroupButtonItem(label: 'URL'),
                                                DGroupButtonItem(label: 'Address'),
                                                DGroupButtonItem(label: 'Textarea'),
                                                DGroupButtonItem(label: 'Search')
                                            ],
                                            color: DButtonColor.primary,
                                            onChanged: (item) {
                                                setState(() {
                                                        switch (item.label) {
                                                            case 'Text':
                                                                selectedInputType = DInputType.text;
                                                                break;
                                                            case 'Email':
                                                                selectedInputType = DInputType.email;
                                                                break;
                                                            case 'Phone':
                                                                selectedInputType = DInputType.phone;
                                                                break;
                                                            case 'Password':
                                                                selectedInputType = DInputType.password;
                                                                break;
                                                            case 'Number':
                                                                selectedInputType = DInputType.number;
                                                                break;
                                                            case 'URL':
                                                                selectedInputType = DInputType.url;
                                                                break;
                                                            case 'Address':
                                                                selectedInputType = DInputType.address;
                                                                break;
                                                            case 'Textarea':
                                                                selectedInputType = DInputType.textarea;
                                                                break;
                                                            case 'Search':
                                                                selectedInputType = DInputType.search;
                                                                break;
                                                        }
                                                    });
                                            } 
                                        ),
                                        DListTileCheckBox(
                                            title: "Required",
                                            value: required,
                                            enabled: selectedInputType != DInputType.search,
                                            onChanged: (value) {
                                                setState(() {
                                                        required = !required;
                                                    });
                                            }
                                        ),
                                        DListTileCheckBox(
                                            title: "Read Only",
                                            value: readOnly,
                                            onChanged: (value) {
                                                setState(() {
                                                        readOnly = !readOnly;
                                                    });
                                            }
                                        ),
                                        DListTileCheckBox(
                                            title: "With Icon",
                                            value: withIcon,
                                            enabled: ![DInputType.phone, DInputType.search].contains(selectedInputType),
                                            onChanged: (value) {
                                                setState(() {
                                                        withIcon = value!;
                                                        setIcon();
                                                    });
                                            }
                                        ),
                                        DListTileCheckBox(
                                            title: "With Icon Button",
                                            value: withIconButton,
                                            enabled: selectedInputType != DInputType.password,
                                            onChanged: (value) {
                                                setState(() {
                                                        withIconButton = value == true;
                                                        rightIconButton = withIconButton
                                                            ? IconButton(
                                                                icon: Icon(Icons.clear),
                                                                onPressed: () {

                                                                }
                                                            ) : null;
                                                    });
                                            }
                                        ),
                                        DListTileCheckBox(
                                            title: "With Elevated Button",
                                            value: withElevatedButton,
                                            enabled: selectedInputType != DInputType.password,
                                            onChanged: (value) {
                                                setState(() {
                                                        withElevatedButton = value == true;
                                                        rightButton = withElevatedButton
                                                            ? DInputPrefixButton(
                                                                icon: Icons.clear,
                                                                onPressed: () {

                                                                }
                                                            ) : null;
                                                    });
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
