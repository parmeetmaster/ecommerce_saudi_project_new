import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Screens/DetailScreen/Components/curverdBox.dart';
import 'package:flutter_app_demo_saudi/Screens/DetailScreen/Components/roundedCircle.dart';
import 'package:flutter_app_demo_saudi/api/rapidApiProductDetailApi.dart';
import 'package:flutter_app_demo_saudi/model/product_model.dart';
import 'package:flutter_app_demo_saudi/widgets/shoppingcart.dart';

class DetailScreenProvider extends ChangeNotifier {
  int activeIndex = 0;
  List<Color> productColors = [
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.pinkAccent
  ];
  List<Widget> colorWidgets;
  List<String> productSizes = ["S", "M", "L", "XL"];
  List<Widget> product_size_list;
  ShoppingController controller = new ShoppingController();
  var price = "\$ 80";
  int cartcount = 0;
  bool isOnceLoaded = false;

  generateColorCircles() async {
    colorWidgets = [];
    int i = 0;
    for (Color item in productColors) {
      if (i == 0) {
        colorWidgets.add(InkWell(
            onTap: () {
              changeActiveColor(item);
            },
            child: RoundedCircle(color: item, isborderActive: true)));
      } else {
        colorWidgets.add(InkWell(
            onTap: () {
              activeIndex = i;
              changeActiveColor(item);
            },
            child: RoundedCircle(color: item, isborderActive: false)));
      }
      colorWidgets.add(SizedBox(
        height: 10,
      ));
      print("$i");
      i++;
    }
  }

  changeActiveColor(Color activecolor) {
    colorWidgets = [];
    int i = 0;
    for (Color item in productColors) {
      if (item == activecolor) {
        colorWidgets.add(InkWell(
            onTap: () {
              changeActiveColor(item);
            },
            child: RoundedCircle(color: item, isborderActive: true)));
      } else {
        colorWidgets.add(InkWell(
            onTap: () {
              changeActiveColor(item);
            },
            child: RoundedCircle(color: item, isborderActive: false)));
      }
      colorWidgets.add(SizedBox(
        height: 10,
      ));
      i++;
    }
    notifyListeners();
  }

  generateCurveBoxes() async {
    product_size_list = [];
    int i = 0;
    for (String text in productSizes) {
      if (i == 0) {
        product_size_list.add(InkWell(
            onTap: () {
              changeActiveBox(text);
            },
            child: CurvedBox(
              text: text,
              isActive: true,
            )));
      } else {
        product_size_list.add(InkWell(
            onTap: () {
              changeActiveBox(text);
            },
            child: CurvedBox(
              text: text,
              isActive: false,
            )));
      }
      product_size_list.add(SizedBox(
        height: 10,
      ));
      print("$i");
      i++;
    }
  }

  changeActiveBox(String item) {
    print("change active box $item");
    product_size_list = [];
    int i = 0;
    for (String x in productSizes) {
      if (x == item) {
        product_size_list.add(InkWell(
            onTap: () {
              changeActiveBox(x);
            },
            child: CurvedBox(
              text: x,
              isActive: true,
            )));
      } else {
        product_size_list.add(InkWell(
            onTap: () {
              changeActiveBox(x);
            },
            child: CurvedBox(
              text: x,
              isActive: false,
            )));
      }
      product_size_list.add(SizedBox(
        height: 10,
      ));
      i++;
    }
    notifyListeners();
  }

  void buyItem() {
    cartcount += 1;
    controller.changeCount(cartcount);
  }

  Future<void> loadProductDetails(Results args) async {

    var queryParameters = {
      "asin": "${args.asin}",
      "country": "US",
    };

    Response resp = await RapidApiProductDetailApi()
        .getclient()
        .get("/product", queryParameters: queryParameters);
    //print(resp.data);

    print("currunt page is${resp.data}");



  }
}
