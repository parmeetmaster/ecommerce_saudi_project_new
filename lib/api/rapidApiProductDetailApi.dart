
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../constantPackage/constStrings.dart';

import '../utils/app_logger.dart';
import '../utils/preference.dart';


class LogInterceptors extends Interceptor {
  Function(DioError) dioerrFunction;
  @override
  Future onRequest(RequestOptions options)async {
    print("option base url is ${options.baseUrl}");
  }

  @override
  Future onError(DioError err)async {
    if(dioerrFunction!=null){
      dioerrFunction(err);
    }

  }

  @override
  Future onResponse(Response response) async{
    AppLogger.print(""
        "Base url is : ${response.request.baseUrl} path is ${response.request.path}\n"
        "Query Parameters is : ${response.request.queryParameters}\n"
        "Headers is : ${response.request.headers}\n"
        "Data is Parameters is : ${response.request.headers}\n"
        "Data is Parameters is : ${response.request.data}\n"


    );
  }
}


class RapidApiProductDetailApi {
  String rapidApiLink="https://amazon-products1.p.rapidapi.com";
  static Dio dioservice=null;
  static final logInterceptor=LogInterceptors();
  BaseOptions baseOptions;
  RapidApiProductDetailApi({ this.baseOptions}){

    dioservice = Dio();
    dioservice.interceptors.add(logInterceptor); // adding Logging for error and track request and responses
    addBaseOptions(); // its called if no base option take global base options

  }

  addBaseOptions(){
    if(baseOptions!=null){
      dioservice.options = baseOptions;
    }else{

      dioservice.options = new BaseOptions(
        baseUrl: rapidApiLink,
        connectTimeout: 300000,
        receiveTimeout: 300000,);
      dioservice.options.headers['x-rapidapi-key'] = '684e680847msh32ca30af9167cacp1a86a6jsn0df3e838aeeb';
      dioservice.options.headers["x-rapidapi-host"] = "amazon-products1.p.rapidapi.com";
      dioservice.options.headers["useQueryString"] = true;
    }
    return dioservice;
  }

  Dio getclient() {
    return dioservice;
  }


  void addInterceptor(InterceptorsWrapper wrapper){
    dioservice.interceptors.add(wrapper);
  }

  Future<Response<dynamic>> _errorHandler(DioError dioError) async {
    AppLogger.print(dioError.toString());

    String message;
    if (dioError.type == DioErrorType.RESPONSE) {
      final data = dioError.response.data;
      AppLogger.print(data.toString());

      if (dioError.response.statusCode == 400) {
        message = data['error'];
      } else if (dioError.response.statusCode == 401) {
        message = data['error'];
        if (!message.toLowerCase().contains("otp")){}

      } else if (dioError.response.statusCode == 403) {
        message = "Forbidden";
      } else if (dioError.response.statusCode == 404) {
        message = "Not found";
      } else if (dioError.response.statusCode == 405) {
        message = "Route does not exist";
      } else if (dioError.response.statusCode == 500) {
        message = dioError.message;
      } else {
        message = "Something went wrong";
      }
    } else if (dioError.type == DioErrorType.CONNECT_TIMEOUT) {
      message = "connection timedout";
    } else if (dioError.type == DioErrorType.DEFAULT) {
      if (dioError.message.contains('SocketException')) {
        message = "no internet";
      }
    }

    AppLogger.print(message);


    return dioError.response;
  }

  void addErrorHandler(Function(DioError) mdioerrFunction){
    logInterceptor.dioerrFunction=mdioerrFunction;
  }

}
