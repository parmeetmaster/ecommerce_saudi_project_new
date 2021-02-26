import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Global/Global.dart';
import 'package:flutter_app_demo_saudi/Screens/DetailScreen/Components/curverdBox.dart';
import 'package:flutter_app_demo_saudi/Screens/DetailScreen/Components/roundedCircle.dart';
import 'package:flutter_app_demo_saudi/api/rapidApiProductDetailApi.dart';
import 'package:flutter_app_demo_saudi/model/ProductDescriptionModel.dart';
import 'package:flutter_app_demo_saudi/model/product_detail_description.dart';

import 'package:flutter_app_demo_saudi/model/product_model.dart';
import 'package:flutter_app_demo_saudi/widgets/shoppingcart.dart';
import 'package:url_launcher/url_launcher.dart';

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
  ProductDetailDescription model;
  Icon fav_icon = Icon(Icons.favorite_border_rounded);
  Results args;

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

  void buyItem() async {
    String url = model.fullLink;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> loadProductDetails(Results args) async {
    if (isOnceLoaded == true) return;
    isOnceLoaded = true;
    var queryParameters = {
      "asin": "${args.asin}",
      "country": "US",
    };

    var header = {
      "x-rapidapi-key": "684e680847msh32ca30af9167cacp1a86a6jsn0df3e838aeeb",
      "x-rapidapi-host": "amazon-products1.p.rapidapi.com",
      "useQueryString": "true"
    };
    Response resp = await RapidApiProductDetailApi().getclient().get("/product",
        queryParameters: queryParameters, options: Options(headers: header));

    //this.model= ProductDetailDescription.fromJson(resp.data).;
    this.model = new ProductDetailDescription(
        description: resp.data["description"],
        fullLink: resp.data["full_link"]);
    print("full link is here${resp.data["description"]}");

    notifyListeners();
  }

  Future<void> performUpdate() async {
    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection("Favourite")
        .where("email", isEqualTo: "${Global.user_details.email}")
        .get();
      int snapsize= snap.size;
    if(snapsize>0){
      String document = snap.docs[0].id;
      print("document id is${document}");
      List<dynamic> list_of_favourites=   snap.docs[0].get("favlist");

      list_of_favourites.add(args.toJson());
      // update instance

      FirebaseFirestore.instance
          .collection("Favourite")
          .doc(document)
          .update({"email": "${Global.user_details.email}",
        "favlist":list_of_favourites
      });

    }
    else if(snapsize<=0){
       await FirebaseFirestore.instance
          .collection("Favourite").add({"email":Global.user_details.email,"favlist":[args.toJson()]});

    }

    fav_icon = Icon(Icons.favorite);
    notifyListeners();
  }

  setfavourite() {
    FutureBuilder<void>(
        future: performUpdate(),
        builder: (context, snapshot) {
          print('In Builder');
        });

  }

  void resetfavicon() {
    fav_icon = Icon(Icons.favorite_border_rounded);
  }
}

/*    if(snapsize>0){
      String document = snap.docs[0].id;
      print("document id is${document}");
      List<dynamic> d=   snap.docs[0].get("favo");
      print("single list is${d[0]}");
      Results k=  Results.fromJson(d[0]);
      print("asin is is${k.asin}");


      // update instance
      FirebaseFirestore.instance
          .collection("Favourite")
          .doc(document)
          .update({"email": "parmeets834a@gmail.com",
        "favo":[args.toJson(),args.toJson()]
      });

    }*/


