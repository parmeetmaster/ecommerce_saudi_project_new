import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/constantPackage/constColors.dart';

import 'package:provider/provider.dart';

class RoundedCircle extends StatefulWidget {
  Color color;
  bool isborderActive = true;
  int index;

  RoundedCircle({@required this.color,@required this.isborderActive});

  @override
  _roundedCircleState createState() => _roundedCircleState();
}

class _roundedCircleState extends State<RoundedCircle> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          border: widget.isborderActive
              ? Border.all(
                  width: 2.5,
                  color: rounded_circle_active,
                  style: BorderStyle.solid)
              : Border.all(
                  width: 0,
                  color: Colors.transparent,
                  style: BorderStyle.solid),
          shape: BoxShape.circle,
          color: widget.color
          //    Color(0xFFe0f2f1)

          ),
    );
  }
}
