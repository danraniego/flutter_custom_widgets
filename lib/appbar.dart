import 'package:flutter/material.dart';

class SideDrawer extends StatefulWidget {
    const SideDrawer({super.key});

    @override
    State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
    @override
    Widget build(BuildContext context) {
        return Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: [
                    ExpansionTile(
                        title: Text('Buttons'),
                        children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: ListTile(
                                    title: Text('Normal Buttons'),
                                    onTap: () {
                                        Navigator.pushNamed(context, '/buttons/normal');
                                    }
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: ListTile(
                                    title: Text('Group Buttons'),
                                    onTap: () {
                                        Navigator.pushNamed(context, '/buttons/group');
                                    }
                                )
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: ListTile(
                                    title: Text('Icon Buttons'),
                                    onTap: () {
                                        Navigator.pushNamed(context, '/buttons/icon');
                                    }
                                )
                            )
                        ]
                    ),
                    ListTile(
                        title: Text('Forms'),
                        onTap: () {
                            Navigator.pushNamed(context, '/forms');
                        }
                    ),
                    ListTile(
                        title: Text('Sheets'),
                        onTap: () {
                            Navigator.pushNamed(context, '/sheets');
                        }
                    )
                ]
            )
        );
    }
}
