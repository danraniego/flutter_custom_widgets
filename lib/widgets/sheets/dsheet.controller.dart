import 'package:c_widgets/widgets/sheets/d_list_picker.sheet.dart';
import 'package:flutter/material.dart';

class DListPickerOptions {
    final String? title;
    final List<DListPickerItem>? items;
    final DListPickerItem? selectedItem;
    final bool? searchEnabled;
    final bool? autoSubmit;
    final double? height;

    DListPickerOptions({
        this.title,
        this.items,
        this.selectedItem,
        this.searchEnabled,
        this.autoSubmit,
        this.height
    });}

class DSheetController {

    static Future<DListPickerItem?> showListPicker(BuildContext context, {DListPickerOptions? options}) async {
        return await showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))
            ),
            builder: (context) {
                return DListPickerSheet(
                    title: options?.title ?? 'Select an item',
                    items: options?.items ?? [],
                    selectedItem: options?.selectedItem,
                    searchEnabled: options?.searchEnabled,
                    autoSubmit: options?.autoSubmit ?? false,
                    height: options?.height,
                );
            }
        );
    }
}
