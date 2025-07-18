import 'package:c_widgets/dcolor.dart';
import 'package:c_widgets/widgets/buttons/abstact/d_elevated.button.dart';
import 'package:flutter/material.dart';

class DEPrimaryButton extends DElevatedButton {

  const DEPrimaryButton({
    super.key,
    required super.text,
    super.backgroundColor = DColor.primary,
    super.foregroundColor = Colors.white,
    super.loading,
    super.disabled,
    super.leftIcon,
    super.rightIcon,
    super.onPressed,
  });
}