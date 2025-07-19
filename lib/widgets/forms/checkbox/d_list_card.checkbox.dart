import 'package:c_widgets/config/dconfig.dart';
import 'package:flutter/material.dart';

class DListCardCheckBox extends StatelessWidget {

  final String title;
  final bool value;
  final OnChanged onChanged;

  const DListCardCheckBox({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: CheckboxListTile(
            title: Text(title),
            activeColor: DColor.primary,
            value: value,
            onChanged: (bool? value) => onChanged(value)
        )
    );
  }
}

typedef OnChanged = void Function(bool? value);
