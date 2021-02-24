import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Provider/AnalysisProvider.dart';
import 'package:flutter_app_demo_saudi/Screens/AnalysisImageScreen/AnalysisDetailScreen.dart';
import 'package:flutter_app_demo_saudi/api/clarfieApiService.dart';
import 'package:flutter_app_demo_saudi/api/rapidApiService.dart';
import 'package:flutter_app_demo_saudi/model/AnalysisDataHolder.dart';
import 'package:flutter_app_demo_saudi/model/ClarfiePhotoResponse.dart';
import 'package:flutter_app_demo_saudi/model/ClarfieUploadModel.dart';
import 'package:flutter_app_demo_saudi/model/product_model.dart';
import 'package:flutter_app_demo_saudi/widgets/IndicatorItem.dart';
import 'package:flutter_app_demo_saudi/widgets/ProductItem.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class HomeProvider extends ChangeNotifier {
  ScrollController scrollcontrollerhome = new ScrollController();
  List<Widget> listofProducts = [];
  bool isinitloaded = false;
  int pageno = 1;
  int currentIndex = 0;
  File _image;
  final picker = ImagePicker();
  BuildContext context;
  String query_item="casual wears";

  var isloading=true;

  initload() async {
    if (isinitloaded == false) {
      isinitloaded = true;

      var queryParameters = {
        "query": query_item,
        "country": "US",
        "page": "${pageno}",
      };

      Response resp = await RapidApiService()
          .getclient()
          .get("/search", queryParameters: queryParameters);
      //print(resp.data);

      print("currunt page is${resp.data["error"]}");
      List<Results> list = ProductModel.fromJson(resp.data).results;

      for (int i = 0; i < list.length; i += 2) {
        print(list[i].title);
        try {
          listofProducts.add(
            ProductItem(list[i], list[i + 1]),
          );
        } catch (e) {}
      }
      listofProducts.add(IndicatorItem());
      isloading=false;
      notifyListeners();
    }
  }

  addMore() async {
    var queryParameters = {
      "query": query_item,
      "country": "US",
      "page": "${++pageno}",
    };

    Response resp = await RapidApiService()
        .getclient()
        .get("/search", queryParameters: queryParameters);
    //print(resp.data);

    print("currunt page is${resp.data["error"]}");
    List<Results> list = ProductModel.fromJson(resp.data).results;

    listofProducts.removeAt(listofProducts.length - 1);
    for (int i = 0; i < list.length; i += 2) {
      print(list[i].title);
      try {
        listofProducts.add(
          ProductItem(list[i], list[i + 1]),
        );
      } catch (e) {}
      //  notifyListeners();
    }
    listofProducts.add(IndicatorItem());
    notifyListeners();
  }

  onStartScroll(ScrollMetrics metrics) {
    print("Scroll Start");

  }

  onUpdateScroll(ScrollMetrics metrics) {
    print("Scroll Update");
  }

  onEndScroll(ScrollMetrics metrics) {
    print("Scroll end");
    if (scrollcontrollerhome.position.pixels == scrollcontrollerhome.position.maxScrollExtent) {
      print("Scroll completed");
      addMore();
    }
  }

  takeCameraPicture() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      analysisImageUsingBase64();
    } else {
      print('No image selected.');
    }
  }

  takePictureWithGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      analysisImageUsingBase64();
    } else {
      print('No image selected.');
    }
  }

  analysisImageUsingBase64() async {

    Navigator.pushNamed(context, AnalysisImageScreen.classname,arguments: AnalysisDataHolder(image: _image));

 /*   List<int> imageBytes = _image.readAsBytesSync();
    print(imageBytes);
    String base64Image = base64Encode(imageBytes);
    ClarfieBase64Model obj = ClarfieBase64Model(
        inputs: [Input1(data: Data(image: Image1(base64: base64Image)))]);
    String jsonstr = clarfieBase64ModelToJson(obj);
    Dio dio = ClarfieApiService().getclient();
    Response resp = await dio.post("", data: jsonstr);
    print("response ${resp.data}");

    int len =
        ClarfiePhotoResponse.fromJson(resp.data).outputs[0].data.regions.length;
    for (int k = 0; k < len; k++) {
      String str = ClarfiePhotoResponse.fromJson(resp.data)
          .outputs[0]
          .data
          .regions[k]
          .data
          .concepts[0]
          .name;
      print("products is ${str}");
    }*/
  }

  AnalysisImageUsingUrl() async {
    List<int> imageBytes = _image.readAsBytesSync();
    print(imageBytes);
    String base64Image = base64Encode(imageBytes);
    ClarfieBase64Model obj = ClarfieBase64Model(
        inputs: [Input1(data: Data(image: Image1(base64: base64Image)))]);
    String jsonstr = clarfieBase64ModelToJson(obj);
    Dio dio = ClarfieApiService().getclient();
    Response resp = await dio.post("", data: jsonstr);
    print("response ${resp.data}");

    int len =
        ClarfiePhotoResponse.fromJson(resp.data).outputs[0].data.regions.length;
    for (int k = 0; k < len; k++) {
      String str = ClarfiePhotoResponse.fromJson(resp.data)
          .outputs[0]
          .data
          .regions[k]
          .data
          .concepts[0]
          .name;
      print("products is ${str}");
    }
  }

  void onbottomOptionClick(int value) {
    currentIndex = value;
    if (value == 1) {
      //  takeCameraPicture();
      showAlertDialog(context);
    }
  }

  // replace this function with the examples above
  showAlertDialog(BuildContext context) {
    // set up the list options
    Widget optionOne = SimpleDialogOption(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.camera_alt_rounded),
            SizedBox(width: 15),
            const Text(
              'Camera',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        takeCameraPicture();
      },
    );
    Widget optionTwo = SimpleDialogOption(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.image),
            SizedBox(width: 15),
            const Text(
              'Gallery',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
        takePictureWithGallery();
      },
    );

    // set up the SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      title: const Text('Select an Source'),
      children: <Widget>[
        optionOne,
        optionTwo,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  }

  void setContext(BuildContext mcontext) {
    context = mcontext;
  }

  search(String value) async {
    query_item=value;
    isinitloaded = false;
    listofProducts=[];
    isloading=true;
   await initload();
notifyListeners();
  }
}
