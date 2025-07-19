import 'package:c_widgets/core/d_elevated.button.dart';
import 'package:c_widgets/config/dconfig.dart';
import 'package:flutter/material.dart';

enum DEButtonType {
    primary,
    danger
}

class DEButton extends StatelessWidget {

    final String text;
    final DEButtonType type;
    final bool? loading;
    final bool? disabled;
    final IconData? leftIcon;
    final IconData? rightIcon;
    final VoidCallback? onPressed;

    const DEButton({
        required this.text,
        this.type = DEButtonType.primary,
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
            case DEButtonType.primary:
                backgroundColor = DColor.primary;
                foregroundColor = Colors.white;
                break;
            case DEButtonType.danger:
                backgroundColor = DColor.danger;
                foregroundColor = Colors.white;
                break;
        }

        return DElevatedButton(
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
