import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CurvedBox extends StatefulWidget {
  String text;
  bool isActive = true;
  int index;

  CurvedBox({@required this.text,@required this.isActive});

  @override
  _CurvedBoxState createState() => _CurvedBoxState();
}

class _CurvedBoxState extends State<CurvedBox> {

  @override
  Widget build(BuildContext context) {

    return Container(
        height:50,width:50,
        child:Card(
           color:widget.isActive ? Colors.pink[100] : Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: Text("${widget.text}",style:TextStyle(letterSpacing:1,fontWeight: FontWeight.bold))),
        ));
  }
}
/*

Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          border: widget.isActive
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


*/