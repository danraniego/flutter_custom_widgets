import 'package:c_widgets/appbar.dart';
import 'package:c_widgets/constants/dbutton.type.dart';
import 'package:c_widgets/item_container.dart';
import 'package:c_widgets/item_row.dart';
import 'package:c_widgets/widgets/buttons/d_group.button.dart';
import 'package:flutter/material.dart';

class GroupButtons extends StatefulWidget {
    const GroupButtons({super.key});

    @override
    State<GroupButtons> createState() => _GroupButtonsState();
}

class _GroupButtonsState extends State<GroupButtons> {

    var primarySelected = DGroupButtonItem(
        label: "Primary",
        icon: Icons.check
    );

    var dangerSelected = DGroupButtonItem(
        label: "Primary",
        icon: Icons.check
    );

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Group Buttons")
            ),
            drawer: SideDrawer(),
            body: ListView(
                padding: EdgeInsets.all(20),
                children: [
                    ItemRow(
                        children: [
                            ItemContainer(
                                code: 'DGroupButton(\n'
                                '  color: DButtonColor.primary,\n'
                                '  items: [\n'
                                '    DGroupButtonItem(label: "Primary", icon: Icons.circle),\n'
                                '    DGroupButtonItem(label: "Primary", icon: Icons.square)\n'
                                '  ],\n'
                                '  selectedItem: primarySelected,\n'
                                '  onChanged: (DGroupButtonItem item) {\n'
                                '    setState(() {\n'
                                '      primarySelected = item;\n'
                                '    });\n'
                                '  }\n'
                                ')',
                                child: DGroupButton(
                                    color: DButtonColor.primary,
                                    items: [
                                        DGroupButtonItem(label: "Primary", icon: Icons.circle),
                                        DGroupButtonItem(label: "Primary", icon: Icons.square)
                                    ],
                                    selectedItem: primarySelected,
                                    onChanged: (DGroupButtonItem item) {

                                    }
                                )
                            ),
                            ItemContainer(
                                code: 'DGroupButton(\n'
                                '  color: DButtonColor.danger,\n'
                                '  items: [\n'
                                '    DGroupButtonItem(label: "Danger", icon: Icons.check),\n'
                                '    DGroupButtonItem(label: "Danger", icon: Icons.square)\n'
                                '  ],\n'
                                '  selectedItem: dangerSelected,\n'
                                '  onChanged: (DGroupButtonItem item) {\n'
                                '    setState(() {\n'
                                '      dangerSelected = item;\n'
                                '    });\n'
                                '  }\n'
                                ')',
                                child: DGroupButton(
                                    color: DButtonColor.danger,
                                    items: [
                                        DGroupButtonItem(label: "Danger", icon: Icons.check),
                                        DGroupButtonItem(label: "Danger", icon: Icons.square)
                                    ],
                                    selectedItem: dangerSelected,
                                    onChanged: (DGroupButtonItem item) {
                                        setState(() {
                                                dangerSelected = item;
                                            });
                                    }
                                )
                            ),
                        ]
                    ),
                    ItemRow(
                      children: [
                        ItemContainer(
                            code: 'DGroupButton(\n'
                                '  color: DButtonColor.primary,\n'
                                '  items: [\n'
                                '    DGroupButtonItem(label: "Item 1"),\n'
                                '    DGroupButtonItem(label: "Item 2")\n'
                                '    DGroupButtonItem(label: "Item 3")\n'
                                '  ],\n'
                                '  selectedItem: dangerSelected,\n'
                                '  onChanged: (DGroupButtonItem item) {\n'
                                '    setState(() {\n'
                                '      dangerSelected = item;\n'
                                '    });\n'
                                '  }\n'
                                ')',
                            child: DGroupButton(
                                color: DButtonColor.primary,
                                items: [
                                  DGroupButtonItem(label: "Item 1"),
                                  DGroupButtonItem(label: "Item 2"),
                                  DGroupButtonItem(label: "Item 3")
                                ],
                                selectedItem: primarySelected,
                                onChanged: (DGroupButtonItem item) {

                                }
                            )
                        ),
                        ItemContainer(
                            code: 'DGroupButton(\n'
                                '  color: DButtonColor.danger,\n'
                                '  items: [\n'
                                '    DGroupButtonItem(label: "Item 1"),\n'
                                '    DGroupButtonItem(label: "Item 2")\n'
                                '    DGroupButtonItem(label: "Item 3")\n'
                                '  ],\n'
                                '  selectedItem: dangerSelected,\n'
                                '  onChanged: (DGroupButtonItem item) {\n'
                                '    setState(() {\n'
                                '      dangerSelected = item;\n'
                                '    });\n'
                                '  }\n'
                                ')',
                            child: DGroupButton(
                                color: DButtonColor.danger,
                                items: [
                                  DGroupButtonItem(label: "Item 1"),
                                  DGroupButtonItem(label: "Item 2"),
                                  DGroupButtonItem(label: "Item 3")
                                ],
                                selectedItem: dangerSelected,
                                onChanged: (DGroupButtonItem item) {

                                }
                            )
                        )
                      ],
                    )
                ]
            )
        );
    }
}
