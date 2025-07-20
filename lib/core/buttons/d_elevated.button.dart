import 'package:c_widgets/constants/dbutton.type.dart';
import 'package:flutter/material.dart';

class DElevatedButton extends StatelessWidget {

    final Color backgroundColor;
    final Color foregroundColor;
    final String? textChild;
    final IconData? iconChild;
    final DButtonContent? content;
    final bool? loading;
    final bool? disabled;
    final IconData? leftIcon;
    final IconData? rightIcon;
    final VoidCallback? onPressed;
    final double? width;
    final double? height;

    const DElevatedButton({
        required this.backgroundColor,
        required this.foregroundColor,
        this.content = DButtonContent.text,
        this.textChild,
        this.iconChild,
        this.loading = false,
        this.disabled = false,
        this.leftIcon,
        this.rightIcon,
        this.onPressed,
        this.width,
        this.height,
        super.key
    });

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
              disabledBackgroundColor: backgroundColor.withValues(alpha: 0.7),
              disabledForegroundColor: foregroundColor.withValues(alpha: 0.7),
              padding: EdgeInsets.zero,
              elevation: 0.7,
              backgroundColor: loading == true || disabled == true ? backgroundColor.withValues(alpha: 0.7) : backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(
                      color: loading == true || disabled == true ? backgroundColor.withValues(alpha: 0.7) : backgroundColor, // Border color
                      width: 1
                  )
              ),
              minimumSize: Size(width ?? double.infinity, height ?? 50),
              maximumSize: Size(width ?? double.infinity, height ?? 50)
            ),
            onPressed: disabled == true || loading == true ? null : onPressed,
            child: (content == DButtonContent.text) ? Row(
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
                  Text(textChild ?? '',
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
            ) : Center(
              child: Icon(iconChild, color: foregroundColor, size: 18),
            )
        );
    }
}
