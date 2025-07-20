import 'package:c_widgets/constants/dbutton.type.dart';
import 'package:c_widgets/core/buttons/d_elevated.button.dart';
import 'package:c_widgets/config/dconfig.dart';
import 'package:c_widgets/core/buttons/d_outlined.button.dart';
import 'package:flutter/material.dart';

class DIconButton extends StatelessWidget {

    final DButtonType type;
    final DButtonColor color;
    final IconData? icon;
    final bool? loading;
    final bool? disabled;
    final IconData? leftIcon;
    final IconData? rightIcon;
    final VoidCallback? onPressed;
    final double? width;
    final double? height;

    const DIconButton({
        required this.type,
        required this.color,
        this.icon,
        this.loading = false,
        this.disabled = false,
        this.leftIcon,
        this.rightIcon,
        this.onPressed,
        this.width,
        this.height,
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
                    width: height,
                    height: height,
                    iconChild: icon,
                    content: DButtonContent.icon,
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
                    width: height,
                    height: height,
                    iconChild: icon,
                    content: DButtonContent.icon,
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
