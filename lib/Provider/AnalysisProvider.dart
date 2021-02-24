

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_demo_saudi/api/clarfieApiService.dart';
import 'package:flutter_app_demo_saudi/model/ClarfiePhotoResponse.dart';
import 'package:flutter_app_demo_saudi/model/ClarfieUploadModel.dart';
import 'package:flutter_app_demo_saudi/widgets/simple_item.dart';
import 'package:image_picker/image_picker.dart';

class AnalysisScreenProvider extends ChangeNotifier{
  ScrollController controller = new ScrollController();
  List<Widget> listofProducts = [];
  bool isinitloaded = false;
  int pageno = 1;
  int currentIndex = 0;
  final picker = ImagePicker();
  BuildContext context;
  String query_item="casual wears";

  var isloading=true;

  setContext(BuildContext mcontext){
    context=mcontext;
  }


  Future<bool> analysisImageUsingBase64(File image) async {

    listofProducts=[];
   List<int> imageBytes = image.readAsBytesSync();
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
    List<String> listOfstring=[];

    for (int k = 0; k < len; k++) {
      String str = ClarfiePhotoResponse.fromJson(resp.data)
          .outputs[0]
          .data
          .regions[k]
          .data
          .concepts[0]
          .name;
      listOfstring.add(str);
    }
   listOfstring=listOfstring.toSet().toList();
    for(String productname in listOfstring){
      listofProducts.add(SimpleItem(text: productname,));
    }

return true;
  }

/*  AnalysisImageUsingUrl() async {
    List<int> imageBytes = image.readAsBytesSync();
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
  }*/

}