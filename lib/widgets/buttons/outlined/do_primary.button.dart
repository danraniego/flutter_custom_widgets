import 'package:c_widgets/dcolor.dart';
import 'package:c_widgets/widgets/buttons/abstact/d_outlined.button.dart';
import 'package:flutter/material.dart';

class DOPrimaryButton extends DOutlinedButton {

  const DOPrimaryButton({
    super.key,
    required super.text,
    super.backgroundColor = Colors.transparent,
    super.foregroundColor = DColor.primary,
    super.loading,
    super.disabled,
    super.leftIcon,
    super.rightIcon,
    super.onPressed,
  });
}