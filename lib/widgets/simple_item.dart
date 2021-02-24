import 'package:flutter/material.dart';

class SimpleItem extends StatelessWidget {
  String text;
  SimpleItem({this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "${text}",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
