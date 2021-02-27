import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/constantPackage/constColors.dart';


class ShoppingCart extends StatefulWidget {
  int count = 0;
  ShoppingController controller;

  ShoppingCart({this.count, this.controller});

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

typedef ShoppingCartValueDef(int value);

class ShoppingController {
  ShoppingCartValueDef changeCount;
}

class _ShoppingCartState extends State<ShoppingCart> {


  @override
  void initState() {
    widget.controller.changeCount=changeCount;
  }

  changeCount(int countno){
    setState(() {
      widget.count=countno;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 5, right: 6),
              child: Icon(
                Icons.shopping_cart,
                color: projblack,
              )),
          Positioned(
              left: 12,
              top: 0,
              child: Container(
                height: 15,
                width: 15,
                decoration:
                    BoxDecoration(color: projorange, shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  "${widget.count}",
                  style: TextStyle(fontSize: 10, color: projblack),
                )),
              ))
        ],
      ),
    );
  }


}
