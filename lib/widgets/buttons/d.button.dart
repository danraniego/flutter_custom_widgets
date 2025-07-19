import 'package:c_widgets/constants/dbutton.type.dart';
import 'package:c_widgets/core/buttons/d_elevated.button.dart';
import 'package:c_widgets/config/dconfig.dart';
import 'package:c_widgets/core/buttons/d_outlined.button.dart';
import 'package:flutter/material.dart';

class DButton extends StatelessWidget {

  final String text;
  final DButtonType type;
  final DButtonColor color;
  final bool? loading;
  final bool? disabled;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final VoidCallback? onPressed;

  const DButton({
    required this.text,
    required this.type,
    required this.color,
    this.loading = false,
    this.disabled = false,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    super.key
  });

  getBackgroundColor() {
    switch (type) {
      case DButtonType.elevated:
        switch (color) {
          case DButtonColor.primary:
            return DColor.primary;
          case DButtonColor.danger:
            return DColor.danger;
        }
      case DButtonType.outlined:
        return Colors.transparent;
    }
  }

  getForegroundColor() {
    switch (type) {
      case DButtonType.elevated:
        return Colors.white;
      case DButtonType.outlined:
        return color == DButtonColor.primary ? DColor.primary : DColor.danger;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case DButtonType.elevated:
        return DElevatedButton(
          text: text,
          backgroundColor: getBackgroundColor(),
          foregroundColor: getForegroundColor(),
          loading: loading,
          disabled: disabled,
          leftIcon: leftIcon,
          rightIcon: rightIcon,
          onPressed: onPressed
        );
      case DButtonType.outlined:
        return DOutlinedButton(
          text: text,
          backgroundColor: getBackgroundColor(),
          foregroundColor: getForegroundColor(),
          loading: loading,
          disabled: disabled,
          leftIcon: leftIcon,
          rightIcon: rightIcon,
          onPressed: onPressed
        );
    }
  }
}
