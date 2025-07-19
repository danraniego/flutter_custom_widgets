import 'package:flutter/material.dart';

class DElevatedButton extends StatelessWidget {

    final String text;
    final Color backgroundColor;
    final Color foregroundColor;
    final bool? loading;
    final bool? disabled;
    final IconData? leftIcon;
    final IconData? rightIcon;
    final VoidCallback? onPressed;

    const DElevatedButton({
        required this.text,
        required this.backgroundColor,
        required this.foregroundColor,
        this.loading = false,
        this.disabled = false,
        this.leftIcon,
        this.rightIcon,
        this.onPressed,
        super.key
    });

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
                disabledBackgroundColor: backgroundColor.withValues(alpha: 0.7),
                disabledForegroundColor: foregroundColor.withValues(alpha: 0.7),
                elevation: 0.7,
                backgroundColor: loading == true || disabled == true ? backgroundColor.withValues(alpha: 0.7) : backgroundColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(
                        color: loading == true || disabled == true ? backgroundColor.withValues(alpha: 0.7) : backgroundColor, // Border color
                        width: 1
                    )
                ),
                minimumSize: Size(double.infinity, 50)
            ),
            onPressed: disabled == true || loading == true ? null : onPressed,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    if (loading != null && loading == true)
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: SizedBox(
                            width: 15,
                            height: 15,
                            child: CircularProgressIndicator(
                                strokeWidth: 2, color: foregroundColor
                            )
                        )
                    ),
                    if (leftIcon != null && loading == false)
                    Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(leftIcon, color: foregroundColor, size: 18)
                    ),
                    Text(
                        text,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            color: foregroundColor,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    if (rightIcon != null)
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Icon(rightIcon, color: foregroundColor, size: 18)
                    )
                ]
            )
        );
    }
}
