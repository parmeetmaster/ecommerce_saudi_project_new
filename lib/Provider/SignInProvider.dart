import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInProvider extends ChangeNotifier {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  Function() onsuccessNavigateHome;
  BuildContext context;

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
    if (performBasicValidation() == false) {
      return;
    }


  }

  void setContext(BuildContext context) {
    context = context;
  }

  setOnsuccessSignIn(Function m_onsuccessNavigateHome) {
    onsuccessNavigateHome = m_onsuccessNavigateHome;
  }
}
