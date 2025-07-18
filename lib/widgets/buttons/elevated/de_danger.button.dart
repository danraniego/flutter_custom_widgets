import 'package:c_widgets/dcolor.dart';
import 'package:c_widgets/widgets/buttons/abstact/d_elevated.button.dart';
import 'package:flutter/material.dart';

class DEDangerButton extends DElevatedButton {

  const DEDangerButton({
    super.key,
    required super.text,
    super.backgroundColor = DColor.danger,
    super.foregroundColor = Colors.white,
    super.loading,
    super.disabled,
    super.leftIcon,
    super.rightIcon,
    super.onPressed,
  });
}