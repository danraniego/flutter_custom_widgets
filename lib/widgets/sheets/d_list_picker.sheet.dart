import 'package:c_widgets/constants/dbutton.type.dart';
import 'package:c_widgets/widgets/buttons/d.button.dart';
import 'package:c_widgets/widgets/forms/fields/d_input.field.dart';
import 'package:flutter/material.dart';

class DListPickerItem {
    final String label;
    final String value;
    final IconData? icon;

    DListPickerItem({
        required this.label,
        required this.value,
        this.icon
    });
}

class DListPickerSheet extends StatefulWidget {

    final String title;
    final List<DListPickerItem> items;
    final DListPickerItem? selectedItem;
    final bool? searchEnabled;
    final bool? autoSubmit;
    final double? height;

    const DListPickerSheet({
        required this.title,
        required this.items,
        this.selectedItem,
        this.searchEnabled = false,
        this.autoSubmit = false,
        this.height = 500,
        super.key
    });

    @override
    State<DListPickerSheet> createState() => _DListPickerSheetState();
}

class _DListPickerSheetState extends State<DListPickerSheet> {

    final TextEditingController searchController = TextEditingController();
    List<DListPickerItem> items = [];
    DListPickerItem selectedItem = DListPickerItem(label: '', value: '');

    @override
    void initState() {
        items = widget.items;
        super.initState();
    }

    List<DListPickerItem> filterItems() {
        return items.where((DListPickerItem item) => item.label.toLowerCase().contains(searchController.text.toLowerCase()))
            .toList();
    }

    @override
    Widget build(BuildContext context) {
        return StatefulBuilder(
            builder: (context, setState) {
                return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom
                    ),
                    child: SizedBox(
                        height: widget.height,
                        child: Column(
                            children: [
                                SizedBox(height: 12),
                                Container(
                                    height: 4,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(4)
                                    )
                                ),
                                SizedBox(height: 10),
                                Text(widget.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                                // Search Field
                                if (widget.searchEnabled == true) Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: DInputField(
                                        hintText: "Search",
                                        required: true,
                                        readOnly: false,
                                        validationKey: "Text",
                                        inputType: DInputType.search,
                                        leftIcon: Icons.search,
                                        onChanged: (value) {
                                            setState(() {
                                                    searchController.text = value ?? '';
                                                });
                                        }
                                    )
                                ),

                                // Selected Section
                                if (selectedItem.value.isNotEmpty && widget.autoSubmit == false)
                                Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Text("Selected", style: TextStyle(fontWeight: FontWeight.bold)),
                                            SizedBox(height: 8),
                                            Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: Colors.grey.shade300),
                                                    borderRadius: BorderRadius.circular(8)
                                                ),
                                                child: ListTile(
                                                    title: Text(selectedItem.label),
                                                    trailing: Icon(Icons.check, color: Colors.blue)
                                                )
                                            )
                                        ]
                                    )
                                ),

                                // All List
                                const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text("All", style: TextStyle(fontWeight: FontWeight.bold))
                                    )
                                ),
                                Expanded(
                                    child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey.shade300),
                                                borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: ListView.builder(
                                                itemCount: filterItems().length,
                                                itemBuilder: (context, index) {
                                                    DListPickerItem item = filterItems()[index];
                                                    return Column(
                                                        children: [
                                                            ListTile(
                                                                title: Text(item.label),
                                                                trailing: selectedItem.value == item.value ? Icon(Icons.check, color: Colors.blue) : null,
                                                                onTap: () {
                                                                    setState(() {
                                                                            selectedItem = item;
                                                                            if (widget.autoSubmit == true) {
                                                                                Navigator.pop(context, selectedItem);
                                                                            }
                                                                        });
                                                                }
                                                            ),
                                                            if (index < filterItems().length - 1)
                                                            Divider(height: 1, thickness: 0.5, color: Colors.grey[300])
                                                        ]
                                                    );
                                                }
                                            )
                                        )
                                    )
                                ),

                                // Confirm Button
                                if (widget.autoSubmit == false) Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: DButton(
                                        text: "Confirm",
                                        type: DButtonType.elevated,
                                        color: DButtonColor.primary,
                                        onPressed: () {
                                            Navigator.pop(context, selectedItem);
                                        }
                                    )
                                ),

                                if (widget.autoSubmit == true) Container(
                                    padding: EdgeInsets.all(8)
                                )
                            ]
                        )
                    )
                );
            }
        );
    }
}
