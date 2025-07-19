import 'package:c_widgets/config/dconfig.dart';
import 'package:c_widgets/constants/dbutton.type.dart';
import 'package:c_widgets/core/buttons/d_outlined.button.dart';
import 'package:flutter/material.dart';

class DGroupButtonItem {
    final String label;
    final IconData? icon;

    DGroupButtonItem({
        required this.label,
        this.icon
    });
}

class DGroupButton extends StatefulWidget {

    final DGroupButtonItem? selectedItem;
    final List<DGroupButtonItem> items;
    final DGroupButtonCallback onChanged;
    final DButtonColor color;

    const DGroupButton({
        this.selectedItem,
        required this.items,
        required this.onChanged,
        required this.color,
        super.key
    });

    @override
    State<DGroupButton> createState() => _DGroupButtonState();
}

class _DGroupButtonState extends State<DGroupButton> {

    int selectedIndex = 0;

    getBackgroundColor() {
        switch (widget.color) {
            case DButtonColor.primary:
                return DColor.primary;
            case DButtonColor.danger:
                return DColor.danger;
        }
    }

    getForegroundColor() {
        switch (widget.color) {
            case DButtonColor.primary:
                return Colors.white;
            case DButtonColor.danger:
                return Colors.white;
        }
    }

    @override
    Widget build(BuildContext context) {

        return SizedBox(
            height: 50,
            child: Row(
                children: [
                    for (int i = 0; i < widget.items.length; i++)
                        Expanded(
                            child: DOutlinedButton(
                                text: widget.items[i].label,
                                leftIcon: widget.items[i].icon,
                                active: selectedIndex == i,
                                backgroundColor: selectedIndex == i ? getBackgroundColor() : getForegroundColor(),
                                foregroundColor: selectedIndex == i ? getForegroundColor() : getBackgroundColor(),
                                shape: i > widget.items.length && i < widget.items.length - 1
                                    ? RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0.0)
                                    )
                                    : RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(i == 0 ? DRadius.defaultRadius : 0),
                                            bottomLeft: Radius.circular(i == 0 ? DRadius.defaultRadius : 0),
                                            topRight: Radius.circular(i == widget.items.length - 1 ? DRadius.defaultRadius : 0),
                                            bottomRight: Radius.circular(i == widget.items.length - 1 ? DRadius.defaultRadius : 0)
                                        )
                                    ),
                                side: BorderSide(
                                    color: getBackgroundColor()
                                ),
                                onPressed: () {
                                    setState(() {
                                            selectedIndex = i;
                                        });
                                    widget.onChanged(widget.items[selectedIndex]);
                                }
                            )
                        )
                ]
            )
        );
    }
}

typedef DGroupButtonCallback = void Function(DGroupButtonItem item);
