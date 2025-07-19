import 'package:c_widgets/config/dconfig.dart';
import 'package:flutter/material.dart';

class DListTileCheckBox extends StatelessWidget {

    final String title;
    final bool value;
    final OnChanged onChanged;

    const DListTileCheckBox({
        required this.title,
        required this.value,
        required this.onChanged,
        super.key
    });

    @override
    Widget build(BuildContext context) {
        return Container(
            color: Colors.white,
            child: Column(
                children: [
                    CheckboxListTile(
                        title: Text(title),
                        activeColor: DColor.primary,
                        value: value,
                        onChanged: (bool? value) => onChanged(value)
                    ),
                    const Divider(
                        height: 1,
                        thickness: 1,
                        color: DColor.divider
                    )
                ]
            )
        );
    }
}

typedef OnChanged = void Function(bool? value);
