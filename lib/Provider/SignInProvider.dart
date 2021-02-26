import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Global/Global.dart';
import 'package:flutter_app_demo_saudi/Screens/Home/HomeScreen.dart';
import 'package:flutter_app_demo_saudi/constantPackage/constStrings.dart';
import 'package:flutter_app_demo_saudi/model/UserModel.dart';
import 'package:flutter_app_demo_saudi/utils/preference.dart';

class SignInProvider extends ChangeNotifier {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  Function() onsuccessNavigateHome;
  BuildContext context;
  var firestoreInstance = FirebaseFirestore.instance;


  bool performBasicValidation() {
    bool iserror = false;

    if (emailController.text.isEmpty) {
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("Email is Undefined")));
      iserror = true;
    }

    if (passwordController.text.isEmpty) {
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("Password is Undefined")));
      iserror = true;
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailController.text);

    if (emailValid == false) {
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("Email Format Incorrect")));
      iserror = true;
    }
    return iserror;
  }

  performSignIn() async {
    if (performBasicValidation() != false) {
      return;
    }

    await firestoreInstance
        .collection("Customers")
        .where("email", isEqualTo: emailController.text)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        print(result.data());
        print(result.get("email"));
     /*   if (result.get("email").toString().isNotEmpty ) {
          isuserExist = true;
        }*/
        if(result.get("email").toString()==emailController.text.trim()){
          if(result.get("password").toString()==passwordController.text.trim()){

            print("Login SuccessFul");
             UserModel model=    UserModel(firstname:result.get("firstname").toString(),email: result.get("email").toString(),password: result.get("password").toString(),phonenumber: result.get("phonenumber").toString() );
          Preference.setString(user_credentials,userModelToJson(model));
            Global.user_details=model;
            scaffoldkey.currentState.showSnackBar(SnackBar(content: Text("Log In Successful")));
            onsuccessNavigateHome();
          }else{
            scaffoldkey.currentState.showSnackBar(SnackBar(content: Text("Credential Incorrect or User not Found")));
          }
        }

      });
    });

  }


  setOnsuccessSignIn(Function m_onsuccessNavigateHome) {
    onsuccessNavigateHome = m_onsuccessNavigateHome;
  }
}
