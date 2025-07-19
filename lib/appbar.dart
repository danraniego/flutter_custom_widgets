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
                    ListTile(
                        title: Text('Buttons'),
                        onTap: () {
                            Navigator.pushNamed(context, '/buttons');
                        }
                    ),
                    ListTile(
                        title: Text('Forms'),
                        onTap: () {
                            Navigator.pushNamed(context, '/forms');
                        }
                    ),
                    ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                        onTap: () {
                            // Handle navigation
                        }
                    ),
                    ListTile(
                        leading: Icon(Icons.logout),
                        title: Text('Logout'),
                        onTap: () {
                            // Handle logout
                        }
                    )
                ]
            )
        );
    }
}
