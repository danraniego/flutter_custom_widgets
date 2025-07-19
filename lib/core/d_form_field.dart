import 'package:c_widgets/config/dconfig.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum DFValidation {
    required('Required'),
    email('Email'),
    phone('Phone'),
    url('URL');

    final String label;

    const DFValidation(this.label);
}

class DFValidator {

    static bool isValidEmail(String email) {
        final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
        return emailRegex.hasMatch(email);
    }

    static String? isValidPhone(String value, [String key = 'Phone', bool required = false]) {
        final digits = value.replaceAll(RegExp(r'\D'), '');
        int max = 10;

        if (required == true && value.isNotEmpty) {

            if (digits.length < 10) {
                return "Please enter a valid $key.";
            }

            if (RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(value)) {
                return null; // Valid phone number
            } else {
                return "Please enter a valid $key.";
            }
        } else if (!required && value.isNotEmpty) {
            if (value.length < max && value.length > 1) {
                return "Please enter a valid $key.";
            }

            if (RegExp(r'^\+?[\d\s\-\(\)]+$').hasMatch(value)) {
                return null; // Valid phone number
            } else {
                return "Please enter a valid $key.";
            }
        } else {
            return null;
        }
    }
}

class AlwaysDisabledFocusNode extends FocusNode {
    @override
    bool get hasFocus => false;
}

class DFormField extends StatefulWidget {

    final TextEditingController? controller;
    final TextInputType? inputType;
    final String? labelText;
    final TextStyle? labelStyle;
    final String? hintText;
    final ValidatorCallBack? validator;
    final OnSubmitCallBack? onSubmit;
    final OnChangedCallBack? onChanged;
    final OnTapCallBack? onTap;
    final bool? autoFocus;
    final bool? obscureText;
    final Widget? prefix;
    final Widget? prefixIcon;
    final Widget? suffix;
    final Widget? suffixIcon;
    final bool? labelFloat;
    final bool? readOnly;
    final bool? autoExpand;
    final FloatingLabelBehavior? labelBehavior;
    final String? initialValue;
    final String? prefixText;
    final int? minLines;
    final int? maxLines;
    final String? validationKey;
    final List<DFValidation>? validations;
    final List<TextInputFormatter>? formatters;

    const DFormField({
        this.controller,
        this.inputType,
        this.labelText,
        this.labelStyle,
        this.hintText,
        this.validator,
        this.onSubmit,
        this.onChanged,
        this.onTap,
        this.autoFocus,
        this.obscureText,
        this.prefix,
        this.prefixIcon,
        this.suffix,
        this.suffixIcon,
        this.labelFloat,
        this.readOnly,
        this.autoExpand,
        this.labelBehavior,
        this.initialValue,
        this.prefixText,
        this.minLines,
        this.maxLines,
        this.validationKey,
        this.validations = const [],
        this.formatters = const [],
        super.key
    });

  @override
  State<DFormField> createState() => _DFormFieldState();
}

class _DFormFieldState extends State<DFormField> {

    bool isEnabled = false;
    bool isError = false;

    @override
    Widget build(BuildContext context) {
        return TextFormField(
            keyboardType: widget.inputType ?? TextInputType.text,
            inputFormatters: widget.formatters ?? [],
            autofocus: widget.autoFocus ?? false,
            obscureText: widget.obscureText ?? false,
            controller: widget.controller,
            validator: (widget.validations != null && (widget.validations!.isNotEmpty && widget.validator == null)) ? (value) {
                final isRequired = widget.validations!.contains(DFValidation.required);
                if (isRequired && (value == null || value.isEmpty)) {
                    setState(() {
                        isError = true;
                    });
                    return "Please enter ${widget.validationKey}.";
                }
                if (widget.validations!.contains(DFValidation.email) && !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value!)) {
                    return (isRequired && value.isEmpty) ? "Please enter ${widget.validationKey}." : "Please enter a valid ${widget.validationKey}";
                }
                if (widget.validations!.contains(DFValidation.phone)) {
                    String? error = DFValidator.isValidPhone(value!, widget.validationKey!, isRequired);

                    if (error != null) {
                        setState(() {
                            isError = true;
                        });
                        return error;
                    }
                }
                if (widget.validations!.contains(DFValidation.url) && !RegExp(r'^(https?|ftp)://[^\s/$.?#].[^\s]*$').hasMatch(value!)) {
                    return "Please enter a valid ${widget.validationKey}.";
                }

                setState(() {
                  isError = false;
                });

                return null;
            } : widget.validator,
            onFieldSubmitted: widget.onSubmit,
            onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
                setState(() {
                    isEnabled = false;
                });
            },
            minLines: widget.minLines,
            onChanged: (value) {
                if (widget.onChanged != null) {
                    widget.onChanged!(value);
                }
            },
            initialValue: widget.initialValue,
            onTap: () {
                setState(() {
                    isEnabled = true;
                });
                if (widget.onTap != null) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    widget.onTap!();
                }
            },
            readOnly: widget.readOnly ?? false,
            maxLines: widget.maxLines ?? (widget.autoExpand != null && widget.autoExpand == true ? null : 1),
            decoration: InputDecoration(
                constraints: BoxConstraints(
                    minHeight: 50,
                    minWidth: double.infinity,
                ),
                prefixText: widget.prefixText,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 12
                ), // Match AddressSection
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // Match AddressSection
                    borderSide: BorderSide(width: 1.5, color: DColor.inputBorder) // Match AddressSection
                ),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(width: 1.5, color: DColor.danger)
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(width: 1.5, color: DColor.danger)
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(width: 1.5, color: Colors.grey)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide( width: 1.5, color: DColor.primary)
                ),
                floatingLabelBehavior: widget.labelBehavior ?? FloatingLabelBehavior.never,
                floatingLabelStyle: const TextStyle(color: DColor.primary),
                labelText: widget.labelText,
                labelStyle: widget.labelStyle ?? TextStyle(color: DColor.inputLabelColor),
                hintText: widget.hintText,
                prefix: widget.prefix,
                prefixIcon: widget.prefixIcon != null ? Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: widget.prefixIcon
                )
                    : null,
                prefixIconColor: isEnabled && !isError ? DColor.primary : isError ? DColor.danger : DColor.inputBorder,
                suffix: widget.suffix,
                suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: widget.suffixIcon
                ),
                suffixIconColor: isEnabled && !isError ? DColor.primary : isError ? DColor.danger : DColor.inputBorder,
                filled: DTextFieldConfig.fillColor != Colors.transparent ? true : false,
                fillColor: DTextFieldConfig.fillColor
            ),
            cursorColor: DColor.primary,
        );
    }
}

typedef ValidatorCallBack = String? Function(String? value);
typedef OnSubmitCallBack = void Function(String? value);
typedef OnTapCallBack = void Function();
typedef OnChangedCallBack = void Function(String? value);
