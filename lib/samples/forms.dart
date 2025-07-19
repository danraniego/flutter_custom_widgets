import 'package:c_widgets/appbar.dart';
import 'package:c_widgets/item_container.dart';
import 'package:c_widgets/item_row.dart';
import 'package:c_widgets/widgets/forms/fields/d_email.field.dart';
import 'package:c_widgets/widgets/forms/fields/d_phone.field.dart';
import 'package:c_widgets/widgets/forms/fields/d_text.field.dart';
import 'package:flutter/material.dart';

class Forms extends StatefulWidget {


  const Forms({super.key});

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forms"),
      ),
      drawer: SideDrawer(),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUnfocus,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
          ],
        ),
      ),
    );
  }
}
