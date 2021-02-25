import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Provider/DetailsScreenProvider.dart';
import 'package:flutter_app_demo_saudi/constantPackage/constColors.dart';
import 'package:flutter_app_demo_saudi/model/DetailScreenModel.dart';
import 'package:flutter_app_demo_saudi/model/product_model.dart';
import 'package:flutter_app_demo_saudi/widgets/shoppingcart.dart';

import 'package:provider/provider.dart';

import 'Components/curverdBox.dart';
import 'Components/roundedCircle.dart';

class DetailScreen extends StatefulWidget {
  static const screename = "/DetailScreen";

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double appheight = 280;
  bool isexpanded = false;
  double _dotposition = 0;
  BoxConstraints descriptionConstraints;

  @override
  void initState() {
    final provider = Provider.of<DetailScreenProvider>(context, listen: false);
    provider.generateColorCircles();
    provider.generateCurveBoxes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Results args = ModalRoute.of(context).settings.arguments;
//final DetailScreenModel Results=DetailScreenModel(imgUrl: "",tag: "");
    final provider = Provider.of<DetailScreenProvider>(context);
    provider.loadProductDetails(args);
    _expandBottom() {
      print("expand bottom called");

      if (isexpanded == false) {
        appheight = appheight + 250;
        isexpanded = true;
      } else if (isexpanded == true) {
        appheight = appheight - 250;
        isexpanded = false;
      }
      provider.notifyListeners();
    }

    return Scaffold(
        body: Consumer<DetailScreenProvider>(builder: (context, value, child) {
      return FutureBuilder(
        future: value.loadProductDetails(args),
        builder: (context,AsyncSnapshot snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Container(child: Center(child: CircularProgressIndicator(),),);
          }
          else if(snapshot.connectionState==ConnectionState.done){
            return Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.network(
                    args.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DotsIndicator(
                      dotsCount: 1,
                      position: _dotposition,
                      decorator: DotsDecorator(
                          color: Colors.grey[400], activeColor: Colors.white)),
                  AnimatedContainer(
                    duration: new Duration(milliseconds: 200),
                    height: appheight,
                    child: new Container(
                      color: Colors.transparent,
                      //could change this to Color(0xFF737373),
                      //so you don't have to change MaterialApp canvasColor
                      child: new Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(50.0),
                                  topRight: const Radius.circular(50.0))),
                          child: Column(
                            children: [
                              InkWell(
                                child: Container(
                                    width: 70,
                                    height: 50,
                                    child: Divider(
                                      thickness: 4,
                                      height: 20,
                                      color: Colors.grey[400],
                                    )),
                                onTap: _expandBottom,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 40),
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Woolean Coat",
                                                textDirection: TextDirection.ltr,
                                                style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w800),
                                              ),
                                              Text(
                                                "${value.price}",
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    color: projgrey,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                "Your Size",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: projblack,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                children: value.product_size_list,
                                              ),
                                              SizedBox(height: 10),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Icon(Icons.remove_red_eye_rounded),
                                            SizedBox(height: 10),
                                            Icon(Icons.favorite_border_rounded)
                                          ],
                                        ),
                                      ),
                                    ]),
                              ),
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: ColumnSuper(
                                    children: [
                                      InkWell(
                                        onTap: provider.buyItem,
                                        child: Container(
                                          height: 60,
                                          width: 350,
                                          decoration: BoxDecoration(
                                              color: projblack,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30))),
                                          child: Center(
                                              child: Text("Buy Now",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.w800))),
                                        ),
                                      ),
                                      SizedBox(height: 30),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text("Composition",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold)),
                                                Text("Plyster")
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              children: [
                                                Text("Country",
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold)),
                                                Text("India")
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Care",
                                              style: TextStyle(
                                                  color: projgrey,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Spacer(),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Container(
                                          height: 411,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Text(
                                                "So how did the classical Latin become so "
                                                    "incoherent? According to McClintock, a 15th century typesetter likely"
                                                    " scrambled part of Cicero's De Finibus in order to provide placeholder text"
                                                    " to mockup various fonts for a type specimen book.Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatemNeque"
                                                    " porro quisquam est, qui dolorem ipsum quia dolor sit amet,"
                                                    " consectetur, adipisci velit, sed quia non numquam eius"
                                                    " modi tempora incidunt ut labore et dolore magnam aliquam "
                                                    "quaerat voluptatemNeque porro quisquam est, qui dolorem "
                                                    "ipsum quia dolor sit amet, consectetur, adipisci velit,"
                                                    " sed quia non numquam eius modi tempora incidunt ut labore "
                                                    "et dolore magnam aliquam quaerat voluptatemNeque porro quisquam est, "
                                                    "qui dolorem ipsum quia dolor sit amet, consectetur,"
                                                    " adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore"
                                                    " et dolore magnam aliquam q  uaerat voluptatemNeque porro quisquam est,"
                                                    " qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed "
                                                    "quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatemNeque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatemNeque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore etNeque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem dolore magnam aliquam quaerat voluptatem"),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 50,
                  right: 25,
                  child: ShoppingCart(
                      count: provider.cartcount, controller: provider.controller)),
              Positioned(
                  top: 50,
                  left: 25,
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: projblack,
                      )))
            ]);
          }

        }
      );
    }));
  }
}
