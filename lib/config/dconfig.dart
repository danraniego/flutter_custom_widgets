import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DColor {
  static const Color primary = Color.fromARGB(255, 0, 141, 255);
  static const Color secondary = Color.fromARGB(255, 32, 33, 36);
  static const Color danger = Color.fromARGB(255, 220, 38, 38);

  static const Color inputBorder = Color.fromARGB(255, 228, 228, 231);
  static const Color inputLabelColor = Color.fromARGB(255, 85, 95, 102);

  static const Color divider = Color.fromARGB(255, 229, 229, 234);
}

class DTextFieldConfig {
  static const Color fillColor = Colors.transparent;
  static const Color prefixIconColor = Color.fromARGB(255, 228, 228, 231);
  static const Color suffixIconColor = Color.fromARGB(255, 228, 228, 231);
}

class DIcons {
  static const IconData search = CupertinoIcons.search;
  static const IconData close = Icons.close;
}

class DRadius {
  static const double defaultRadius = 8.0;
  static const double smallRadius = 4.0;
  static const double largeRadius = 12.0;
}