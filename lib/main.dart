import 'package:c_widgets/appbar.dart';
import 'package:c_widgets/samples/buttons/group_buttons.dart';
import 'package:c_widgets/samples/sheets.dart';
import 'package:flutter/material.dart';
import 'package:c_widgets/samples/buttons/normal_buttons.dart';
import 'package:c_widgets/samples/forms.dart';
import 'package:c_widgets/config/dconfig.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: DColor.primary,
        appBarTheme: const AppBarTheme(
          backgroundColor: DColor.primary,
          foregroundColor: Colors.white,
          elevation: 1
        ),
      ),
      home: const MyHomePage(title: 'Custom Widgets'),
      routes: {
        '/home': (context) => const MyHomePage(title: 'Custom Widgets'),
        '/buttons/normal': (context) => const NormalButtons(),
        '/buttons/group': (context) => const GroupButtons(),
        // '/forms': (context) => const Forms(),
        //
        // '/sheets': (context) => const Sheets(),
      },
      initialRoute: '/home',
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: SideDrawer()
    );
  }
}
