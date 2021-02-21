import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:path/path.dart';

import 'api_service.dart';

class Api{

/*  Dio dio=ApiService(baseOptions:  BaseOptions(
    baseUrl: "https://news.inrexa.com",
    connectTimeout: 10000,
    receiveTimeout: 10000,)).getclient();*/
  Dio dio= ApiService().getclient();
Future<Response>  requestSamplePost(String name,String email,String password,String authlvl) async{


  var formData= FormData.fromMap({
      "name": "wendux",
      "email":"asndk@gmail.com",
      "password":"asndk@gmail.com",
      "authlvl": 2,


    });


   return dio.post("/signup.php",data:await formData);
  }





}