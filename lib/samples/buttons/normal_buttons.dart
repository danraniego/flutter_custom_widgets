import 'package:c_widgets/appbar.dart';
import 'package:c_widgets/constants/dbutton.type.dart';
import 'package:c_widgets/item_container.dart';
import 'package:c_widgets/item_row.dart';
import 'package:c_widgets/widgets/buttons/d.button.dart';
import 'package:flutter/material.dart';

class NormalButtons extends StatefulWidget {
    const NormalButtons({super.key});

    @override
    State<NormalButtons> createState() => _NormalButtonsState();
}

class _NormalButtonsState extends State<NormalButtons> {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Normal Buttons")
            ),
            drawer: SideDrawer(),
            body: ListView(
                padding: EdgeInsets.all(20),
                children: [
                    // Primary Buttons
                    ItemRow(
                        children: [
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Primary",\n'
                                '  type: DButtonType.elevated,\n'
                                '  color: DButtonColor.primary,\n'
                                '  leftIcon: Icons.circle,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')',
                                child: DButton(
                                    text: "Primary",
                                    type: DButtonType.elevated,
                                    color: DButtonColor.primary,
                                    leftIcon: Icons.circle,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            ),
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Loading",\n'
                                '  type: DButtonType.elevated,\n'
                                '  color: DButtonColor.primary,\n'
                                '  loading: true,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')',
                                child: DButton(
                                    text: "Loading",
                                    type: DButtonType.elevated,
                                    color: DButtonColor.primary,
                                    loading: true,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            ),
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Disabled",\n'
                                '  type: DButtonType.elevated,\n'
                                '  color: DButtonColor.primary,\n'
                                '  disabled: true,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')',
                                child: DButton(
                                    text: "Disabled",
                                    type: DButtonType.elevated,
                                    color: DButtonColor.primary,
                                    disabled: true,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            )
                        ]
                    ),
                    ItemRow(
                        children: [
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Primary",\n'
                                '  type: DButtonType.outlined,\n'
                                '  color: DButtonColor.primary,\n'
                                '  leftIcon: Icons.circle,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')',
                                child: DButton(
                                    text: "Primary",
                                    type: DButtonType.outlined,
                                    color: DButtonColor.primary,
                                    leftIcon: Icons.circle,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            ),
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Loading",\n'
                                '  type: DButtonType.outlined,\n'
                                '  color: DButtonColor.primary,\n'
                                '  loading: true,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')'
                                ,
                                child: DButton(
                                    text: "Loading",
                                    type: DButtonType.outlined,
                                    color: DButtonColor.primary,
                                    loading: true,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            ),
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Disabled",\n'
                                '  type: DButtonType.outlined,\n'
                                '  color: DButtonColor.primary,\n'
                                '  disabled: true,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')',
                                child: DButton(
                                    text: "Disabled",
                                    type: DButtonType.outlined,
                                    color: DButtonColor.primary,
                                    disabled: true,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            )
                        ]
                    ),
                    ItemRow(
                        children: [
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Danger",\n'
                                '  type: DButtonType.elevated,\n'
                                '  color: DButtonColor.danger,\n'
                                '  leftIcon: Icons.circle,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')',
                                child: DButton(
                                    text: "Danger",
                                    type: DButtonType.elevated,
                                    color: DButtonColor.danger,
                                    leftIcon: Icons.circle,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            ),
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Loading",\n'
                                '  type: DButtonType.elevated,\n'
                                '  color: DButtonColor.danger,\n'
                                '  loading: true,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')',
                                child: DButton(
                                    text: "Loading",
                                    type: DButtonType.elevated,
                                    color: DButtonColor.danger,
                                    loading: true,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            ),
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Disabled",\n'
                                '  type: DButtonType.elevated,\n'
                                '  color: DButtonColor.danger,\n'
                                '  disabled: true,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')',
                                child: DButton(
                                    text: "Disabled",
                                    type: DButtonType.elevated,
                                    color: DButtonColor.danger,
                                    disabled: true,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            )
                        ]
                    ),
                    ItemRow(
                        children: [
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Danger",\n'
                                '  type: DButtonType.outlined,\n'
                                '  color: DButtonColor.danger,\n'
                                '  leftIcon: Icons.circle,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')',
                                child: DButton(
                                    text: "Danger",
                                    type: DButtonType.outlined,
                                    color: DButtonColor.danger,
                                    leftIcon: Icons.circle,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            ),
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Loading",\n'
                                '  type: DButtonType.outlined,\n'
                                '  color: DButtonColor.danger,\n'
                                '  loading: true,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')'
                                ,
                                child: DButton(
                                    text: "Loading",
                                    type: DButtonType.outlined,
                                    color: DButtonColor.danger,
                                    loading: true,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            ),
                            ItemContainer(
                                code: 'DButton(\n'
                                '  text: "Disabled",\n'
                                '  type: DButtonType.outlined,\n'
                                '  color: DButtonColor.danger,\n'
                                '  disabled: true,\n'
                                '  onPressed: () {\n'
                                '    ScaffoldMessenger.of(context).showSnackBar(\n'
                                '      SnackBar(content: Text("Pressed!"))\n'
                                '    );\n'
                                '  },\n'
                                ')',
                                child: DButton(
                                    text: "Disabled",
                                    type: DButtonType.outlined,
                                    color: DButtonColor.danger,
                                    disabled: true,
                                    onPressed: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text("Pressed!"))
                                        );
                                    }
                                )
                            )
                        ]
                    ),
                ]
            )
        );
    }
}
