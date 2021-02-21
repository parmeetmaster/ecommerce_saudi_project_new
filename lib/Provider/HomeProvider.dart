



import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/api/rapidApiService.dart';
import 'package:flutter_app_demo_saudi/model/product_model.dart';
import 'package:flutter_app_demo_saudi/widgets/IndicatorItem.dart';
import 'package:flutter_app_demo_saudi/widgets/ProductItem.dart';

class HomeProvider extends ChangeNotifier{
  ScrollController controller=new ScrollController();
List<Widget> listofProducts=[];
bool isinitloaded=false;
int pageno=1;
  Future<void> initload() async {
   if(isinitloaded==false){
     isinitloaded=true;

     var queryParameters= {
       "query": "skirt",
       "country": "US",
       "page": "${pageno}",

     };


     Response resp=await RapidApiService().getclient().get("/search",queryParameters: queryParameters);
     //print(resp.data);

     print("currunt page is${resp.data["error"]}");
     List<Results> list=  ProductModel.fromJson(resp.data).results;

     for(int i=0;i<list.length;i+=2){
       print(list[i].title);
       try {
         listofProducts.add(ProductItem(list[i], list[i + 1]),);

       }catch(e){

       }
     }
     listofProducts.add(IndicatorItem());
     notifyListeners();


   }


  }

  addMore() async {

      var queryParameters= {
        "query": "skirt",
        "country": "US",
        "page": "${++pageno}",

      };


      Response resp=await RapidApiService().getclient().get("/search",queryParameters: queryParameters);
      //print(resp.data);

      print("currunt page is${resp.data["error"]}");
      List<Results> list=  ProductModel.fromJson(resp.data).results;


      listofProducts.removeAt(listofProducts.length-1);
      for(int i=0;i<list.length;i+=2){
        print(list[i].title);
        try {
          listofProducts.add(ProductItem(list[i], list[i + 1]),);

        }catch(e){

        }
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
    if(controller.position.pixels == controller.position.maxScrollExtent){
      print("Scroll completed");
      addMore();
    }
  }



}