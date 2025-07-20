import 'package:c_widgets/core/d_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DPasswordField extends StatefulWidget {

  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? validationKey;
  final bool? required;
  final bool? readOnly;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final OnChangedCallBack? onChanged;

  const DPasswordField({
    this.controller,
    this.labelText,
    this.hintText,
    this.validationKey,
    this.required = false,
    this.readOnly = false,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    super.key
  });

  @override
  State<DPasswordField> createState() => _DPasswordFieldState();
}

class _DPasswordFieldState extends State<DPasswordField> {

  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return DFormField(
      controller: widget.controller,
      inputType: TextInputType.text,
      labelText: widget.labelText,
      hintText: widget.hintText,
      validationKey: widget.validationKey,
      validations: [
        ? (widget.required == true) ? DFValidation.required : null,
      ],
      readOnly: widget.readOnly,
      enabled: !(widget.readOnly == true),
      prefixIcon: widget.prefixIcon,
      obscureText: obscureText,
      suffix: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        child: InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye),
            )
        ),
      ),
      onChanged: widget.onChanged,
    );
  }
}
