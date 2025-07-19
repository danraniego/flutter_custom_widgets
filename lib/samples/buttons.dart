import 'package:c_widgets/appbar.dart';
import 'package:c_widgets/item_container.dart';
import 'package:c_widgets/item_row.dart';
import 'package:c_widgets/widgets/buttons/de.button.dart';
import 'package:c_widgets/widgets/buttons/do.button.dart';
import 'package:c_widgets/widgets/forms/checkbox/d_list_card.checkbox.dart';
import 'package:c_widgets/widgets/forms/checkbox/d_list_tile.checkbox.dart';
import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
    const Buttons({super.key});

    @override
    State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {

    var elevatedType = DEButtonType.primary;
    var elevatedLeftIconButton = false;
    var elevatedRightIconButton = false;
    var elevatedLoadingButton = false;
    var elevatedDisabledButton = false;

    var outlinedType = DOButtonType.primary;
    var outlinedLeftIconButton = false;
    var outlinedRightIconButton = false;
    var outlinedLoadingButton = false;
    var outlinedDisabledButton = false;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Buttons")
            ),
            drawer: SideDrawer(),
            body: ListView(
                padding: EdgeInsets.all(20),
                children: [
                    // Elevated Buttons
                    ItemRow(
                        title: "Elevated Buttons",
                        children: [
                            ItemContainer(
                                code: 'DEButton(\n'
                                '    text: "Button",\n'
                                '    type: ${elevatedType == DEButtonType.primary ? 'DEButtonType.primary' : 'DEButtonType.danger' },\n'
                                '${elevatedLeftIconButton ? '    leftIcon: Icons.circle,\n' : ''}'
                                '${elevatedRightIconButton ? '    rightIcon: Icons.circle,\n' : ''}'
                                '    loading: $elevatedLoadingButton,\n'
                                '    disabled: $elevatedDisabledButton,\n'
                                '    onPressed: () {\n'
                                '      \n'
                                '    }\n'
                                ')',
                                child: DEButton(
                                    text: "Button",
                                    type: elevatedType,
                                    leftIcon: elevatedLeftIconButton == true ? Icons.circle : null,
                                    rightIcon: elevatedRightIconButton == true ? Icons.circle : null,
                                    loading: elevatedLoadingButton,
                                    disabled: elevatedDisabledButton,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            ),
                            Column(
                                children: [
                                    Row(
                                        children: [
                                            Expanded(
                                                child: DEButton(
                                                    text: "Primary Button",
                                                    type: DEButtonType.primary,
                                                    onPressed: () {
                                                        setState(() {
                                                                elevatedType = DEButtonType.primary;
                                                            });
                                                    }
                                                )
                                            ),
                                            const SizedBox(width: 20),
                                            Expanded(
                                                child: DEButton(
                                                    text: "Danger Button",
                                                    type: DEButtonType.danger,
                                                    onPressed: () {
                                                        setState(() {
                                                                elevatedType = DEButtonType.danger;
                                                            });
                                                    }
                                                )
                                            )
                                        ]
                                    ),
                                    const SizedBox(height: 10),
                                    DListTileCheckBox(
                                        title: "Left Icon",
                                        value: elevatedLeftIconButton,
                                        onChanged: (bool? value) {
                                            setState(() {
                                                    elevatedLeftIconButton = value ?? false;
                                                });
                                        }
                                    ),
                                    DListTileCheckBox(
                                        title: "Right Icon",
                                        value: elevatedRightIconButton,
                                        onChanged: (bool? value) {
                                            setState(() {
                                                    elevatedRightIconButton = value ?? false;
                                                });
                                        }
                                    ),
                                    DListTileCheckBox(
                                        title: "Loading",
                                        value: elevatedLoadingButton,
                                        onChanged: (bool? value) {
                                            setState(() {
                                                    elevatedLoadingButton = value ?? false;
                                                });
                                        }
                                    ),
                                    DListTileCheckBox(
                                        title: "Disabled",
                                        value: elevatedDisabledButton,
                                        onChanged: (bool? value) {
                                            setState(() {
                                                    elevatedDisabledButton = value ?? false;
                                                });
                                        }
                                    )
                                ]
                            )
                        ]
                    ),

                    // Outlined Buttons
                    ItemRow(
                        title: "Outline Buttons",
                        children: [
                            ItemContainer(
                                code: 'DOButton(\n'
                                '    text: "Button",\n'
                                '    type: ${outlinedType == DOButtonType.primary ? 'DOButtonType.primary' : 'DOButtonType.danger' },\n'
                                '${outlinedLeftIconButton ? '    leftIcon: Icons.circle,\n' : ''}'
                                '${outlinedRightIconButton ? '    rightIcon: Icons.circle,\n' : ''}'
                                '    loading: $outlinedLoadingButton,\n'
                                '    disabled: $outlinedDisabledButton,\n'
                                '    onPressed: () {\n'
                                '      \n'
                                '    }\n'
                                ')',
                                child: DOButton(
                                    text: "Button",
                                    type: outlinedType,
                                    leftIcon: outlinedLeftIconButton == true ? Icons.circle : null,
                                    rightIcon: outlinedRightIconButton == true ? Icons.circle : null,
                                    loading: outlinedLoadingButton,
                                    disabled: outlinedDisabledButton,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            ),
                            Column(
                                children: [
                                    Row(
                                        children: [
                                            Expanded(
                                                child: DOButton(
                                                    text: "Primary Button",
                                                    type: DOButtonType.primary,
                                                    onPressed: () {
                                                        setState(() {
                                                                outlinedType = DOButtonType.primary;
                                                            });
                                                    }
                                                )
                                            ),
                                            const SizedBox(width: 20),
                                            Expanded(
                                                child: DOButton(
                                                    text: "Danger Button",
                                                    type: DOButtonType.danger,
                                                    onPressed: () {
                                                        setState(() {
                                                                outlinedType = DOButtonType.danger;
                                                            });
                                                    }
                                                )
                                            )
                                        ]
                                    ),
                                    const SizedBox(height: 10),
                                    DListTileCheckBox(
                                        title: "Left Icon",
                                        value: outlinedLeftIconButton,
                                        onChanged: (bool? value) {
                                            setState(() {
                                                    outlinedLeftIconButton = value ?? false;
                                                });
                                        }
                                    ),
                                    DListTileCheckBox(
                                        title: "Right Icon",
                                        value: outlinedRightIconButton,
                                        onChanged: (bool? value) {
                                            setState(() {
                                                    outlinedRightIconButton = value ?? false;
                                                });
                                        }
                                    ),
                                    DListTileCheckBox(
                                        title: "Loading",
                                        value: outlinedLoadingButton,
                                        onChanged: (bool? value) {
                                            setState(() {
                                                    outlinedLoadingButton = value ?? false;
                                                });
                                        }
                                    ),
                                    DListTileCheckBox(
                                        title: "Disabled",
                                        value: outlinedDisabledButton,
                                        onChanged: (bool? value) {
                                            setState(() {
                                                    outlinedDisabledButton = value ?? false;
                                                });
                                        }
                                    )
                                ]
                            )
                        ]
                    )
                ]
            )
        );
    }
}
