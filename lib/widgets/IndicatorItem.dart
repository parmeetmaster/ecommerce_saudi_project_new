import 'package:flutter/material.dart';

class IndicatorItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:50,
      width: MediaQuery.of(context).size.width,
      child:Center(
        child: Container(
          height:25,
            width:25,
            child: CircularProgressIndicator()),
      ),
    );
  }
}
