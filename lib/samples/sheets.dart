import 'package:c_widgets/appbar.dart';
import 'package:c_widgets/item_container.dart';
import 'package:c_widgets/item_row.dart';
import 'package:c_widgets/widgets/forms/checkbox/d_list_tile.checkbox.dart';
import 'package:c_widgets/widgets/sheets/d_list_picker.sheet.dart';
import 'package:flutter/material.dart';

class Sheets extends StatefulWidget {

    const Sheets({super.key});

    @override
    State<Sheets> createState() => _SheetsState();
}

class _SheetsState extends State<Sheets> {

    var listPickerWithSearch = false;
    var listPickerAutoSubmit = false;
    var lisPickerCountries = <DListPickerItem>[
        DListPickerItem(label: "United States", value: "us", icon: Icons.flag),
        DListPickerItem(label: "Canada", value: "ca", icon: Icons.flag),
        DListPickerItem(label: "Mexico", value: "mx", icon: Icons.flag),
        DListPickerItem(label: "United Kingdom", value: "uk", icon: Icons.flag),
        DListPickerItem(label: "Germany", value: "de", icon: Icons.flag),
        DListPickerItem(label: "France", value: "fr", icon: Icons.flag),
        DListPickerItem(label: "Spain", value: "es", icon: Icons.flag),
        DListPickerItem(label: "Italy", value: "it", icon: Icons.flag)
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text("Forms")
            ),
            drawer: SideDrawer(),
            body: ListView(
                padding: EdgeInsets.all(20),
                children: [
                    ItemRow(
                        title: "Input Fields",
                        children: [
                            ItemContainer(
                                code: '',
                                child: DListPickerSheet(
                                    title: "Countries",
                                    items: lisPickerCountries,
                                    selectedItem: lisPickerCountries.first,
                                    searchEnabled: listPickerWithSearch
                                )
                            ),
                            Column(
                                children: [
                                    DListTileCheckBox(
                                        title: "With Search",
                                        value: listPickerWithSearch,
                                        onChanged: (bool? value) {
                                            setState(() {
                                                    listPickerWithSearch = value ?? false;
                                                });
                                        }
                                    ),
                                    DListTileCheckBox(
                                        title: "Auto Submit",
                                        value: listPickerWithSearch,
                                        onChanged: (bool? value) {
                                            setState(() {
                                                    listPickerWithSearch = value ?? false;
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
