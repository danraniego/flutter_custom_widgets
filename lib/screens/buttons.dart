import 'package:c_widgets/appbar.dart';
import 'package:c_widgets/item_container.dart';
import 'package:c_widgets/item_row.dart';
import 'package:c_widgets/widgets/buttons/abstact/d_elevated.button.dart';
import 'package:c_widgets/widgets/buttons/elevated/de_danger.button.dart';
import 'package:c_widgets/widgets/buttons/elevated/de_primary.button.dart';
import 'package:c_widgets/widgets/buttons/outlined/do_danger.button.dart';
import 'package:c_widgets/widgets/buttons/outlined/do_primary.button.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Buttons"),
        ),
        drawer: SideDrawer(),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          // Elevated Buttons
          ItemRow(
            title: "Elevated Primary Buttons",
            children: [
              ItemContainer(
                code: 'DEPrimaryButton(\n'
                '  text: "Button",\n'
                '  leftIcon: Icons.circle,\n'
                '  onPressed: () {\n'
                '                  \n'
                '  },\n'
                '),',
                child: DEPrimaryButton(
                  text: "Button",
                  leftIcon: Icons.circle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DEPrimaryButton(\n'
                    '  text: "Button",\n'
                    '  rightIcon: Icons.circle,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DEPrimaryButton(
                  text: "Button",
                  rightIcon: Icons.circle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DEPrimaryButton(\n'
                    '  text: "Loading",\n'
                    '  loading: true,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DEPrimaryButton(
                  text: "Loading",
                  loading: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DEPrimaryButton(\n'
                    '  text: "Disabled",\n'
                    '  disabled: true,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DEPrimaryButton(
                  text: "Disabled",
                  disabled: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              )
            ],
          ),
          ItemRow(
            title: "Elevated Error Buttons",
            children: [
              ItemContainer(
                code: 'DEDangerButton(\n'
                    '  text: "Button",\n'
                    '  leftIcon: Icons.circle,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DEDangerButton(
                  text: "Button",
                  leftIcon: Icons.circle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DEDangerButton(\n'
                    '  text: "Button",\n'
                    '  rightIcon: Icons.circle,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DEDangerButton(
                  text: "Button",
                  rightIcon: Icons.circle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DEDangerButton(\n'
                    '  text: "Loading",\n'
                    '  loading: true,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DEDangerButton(
                  text: "Loading",
                  loading: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DEDangerButton(\n'
                    '  text: "Disabled",\n'
                    '  disabled: true,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DEDangerButton(
                  text: "Disabled",
                  disabled: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              )
            ],
          ),

          // Outlined Buttons
          ItemRow(
            title: "Outlined Primary Buttons",
            children: [
              ItemContainer(
                code: 'DOPrimaryButton(\n'
                    '  text: "Primary Button",\n'
                    '  leftIcon: Icons.circle,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DOPrimaryButton(
                  text: "Primary Button",
                  leftIcon: Icons.circle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DOPrimaryButton(\n'
                    '  text: "Primary Button",\n'
                    '  rightIcon: Icons.circle,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DOPrimaryButton(
                  text: "Primary Button",
                  rightIcon: Icons.circle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DOPrimaryButton(\n'
                    '  text: "Loading",\n'
                    '  loading: true,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DOPrimaryButton(
                  text: "Loading",
                  loading: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DOPrimaryButton(\n'
                    '  text: "Disabled",\n'
                    '  disabled: true,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DOPrimaryButton(
                  text: "Disabled",
                  disabled: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              )
            ],
          ),
          ItemRow(
            title: "Outlined Danger Buttons",
            children: [
              ItemContainer(
                code: 'DODangerButton(\n'
                    '  text: "Danger Button",\n'
                    '  leftIcon: Icons.circle,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DODangerButton(
                  text: "Danger Button",
                  leftIcon: Icons.circle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DODangerButton(\n'
                    '  text: "Danger Button",\n'
                    '  rightIcon: Icons.circle,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DODangerButton(
                  text: "Danger Button",
                  rightIcon: Icons.circle,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DODangerButton(\n'
                    '  text: "Loading",\n'
                    '  loading: true,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DODangerButton(
                  text: "Loading",
                  loading: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              ),
              ItemContainer(
                code: 'DODangerButton(\n'
                    '  text: "Disabled",\n'
                    '  disabled: true,\n'
                    '  onPressed: () {\n'
                    '                  \n'
                    '  },\n'
                    '),',
                child: DODangerButton(
                  text: "Disabled",
                  disabled: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Pressed!"))
                    );
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
