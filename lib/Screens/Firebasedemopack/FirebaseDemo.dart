import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Provider/FirebaseDemoProvider.dart';
import 'package:provider/provider.dart';

class FirebaseDemo extends StatefulWidget {
  static const classname='/FirebaseDemo';
  @override
  _FirebaseDemoState createState() => _FirebaseDemoState();
}



class _FirebaseDemoState extends State<FirebaseDemo> {

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<FirebaseDemoProvider>(context).getData();
    return Scaffold(
      appBar: AppBar(),
      body:Consumer<FirebaseDemoProvider>(

        builder: (context, value,child) {
          return Column(children: [
          Text(value.response)
          ],);
        }
      )
    );
  }
}
