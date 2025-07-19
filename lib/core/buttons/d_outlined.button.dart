import 'package:c_widgets/config/dconfig.dart';
import 'package:flutter/material.dart';

class DOutlinedButton extends StatelessWidget {

    final String text;
    final Color backgroundColor;
    final Color foregroundColor;
    final bool? loading;
    final bool? disabled;
    final IconData? leftIcon;
    final IconData? rightIcon;
    final VoidCallback? onPressed;
    final OutlinedBorder? shape;
    final BorderSide? side;
    final bool? active;

    const DOutlinedButton({
        super.key,
        required this.text,
        this.backgroundColor = Colors.transparent,
        this.foregroundColor = Colors.black,
        this.loading = false,
        this.disabled = false,
        this.leftIcon,
        this.rightIcon,
        this.onPressed,
        this.shape,
        this.side,
        this.active
    });

    getBorderColor() {
        if (loading == true || disabled == true) {
            if (active == true) {
                return backgroundColor.withValues(alpha: 0.7);
            }
            return foregroundColor.withValues(alpha: 0.7);
        }

        if (active == true) {
          return backgroundColor.withValues(alpha: 0.7);
        }
        return foregroundColor;
    }

    @override
    Widget build(BuildContext context) {
        return OutlinedButton(
            style: OutlinedButton.styleFrom(
                backgroundColor: backgroundColor,
                elevation: 0,
                shape: shape ?? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(DRadius.defaultRadius)
                ),
                side: side ?? BorderSide(
                    width: 1.0,
                    color: getBorderColor()
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
                            color: loading == true || disabled == true ?
                                foregroundColor.withValues(alpha: 0.7) : foregroundColor,
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

typedef PressedCallBack = void Function();
