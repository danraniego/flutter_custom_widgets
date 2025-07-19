import 'package:c_widgets/core/d_outlined.button.dart';
import 'package:c_widgets/config/dconfig.dart';
import 'package:flutter/material.dart';

enum DOButtonType {
  primary,
  danger
}

class DOButton extends StatelessWidget {

  final String text;
  final DOButtonType type;
  final bool? loading;
  final bool? disabled;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? onPressed;

  const DOButton({
    required this.text,
    this.type = DOButtonType.primary,
    this.loading = false,
    this.disabled = false,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color foregroundColor;

    switch (type) {
      case DOButtonType.primary:
        backgroundColor = Colors.transparent;
        foregroundColor = DColor.primary;
        break;
      case DOButtonType.danger:
        backgroundColor = Colors.transparent;
        foregroundColor = DColor.danger;
        break;
    }

    return DOutlinedButton(
        text: text,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        loading: loading,
        disabled: disabled,
        leftIcon: leftIcon,
        rightIcon: rightIcon,
        onPressed: onPressed
    );
  }
}