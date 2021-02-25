

import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Global/Global.dart';
import 'package:flutter_app_demo_saudi/Screens/Home/HomeScreen.dart';
import 'package:flutter_app_demo_saudi/Screens/SignInScreen/signin.dart';
import 'package:flutter_app_demo_saudi/constantPackage/constStrings.dart';
import 'package:flutter_app_demo_saudi/model/UserModel.dart';
import 'package:flutter_app_demo_saudi/utils/preference.dart';

class SplashProvider extends ChangeNotifier{

  BuildContext context;

checkUserLoginStatus()async {
   try{

   if(Global.user_details!=null){
     Navigator.popAndPushNamed(context, Home.classname);
   }else{
     Navigator.popAndPushNamed(context, SignInPage.classname);
   }

   }catch(e){}

  }

  void setContext(BuildContext mcontext) {
    context=mcontext;
  }


}