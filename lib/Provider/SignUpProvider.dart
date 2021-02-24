import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Screens/Home/HomeScreen.dart';

class SignUpProvider extends ChangeNotifier {
  var firestoreInstance = FirebaseFirestore.instance;
  TextEditingController firstnamecontroller = new TextEditingController();
  TextEditingController lastnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController phonecontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  BuildContext context;

  setContext(BuildContext mcontext) {
    context = mcontext;
  }

  bool performBasicValidation() {
    bool iserror = false;
    if (firstnamecontroller.text.isEmpty) {
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("FirstName is Undefined")));
      iserror = true;
    }

    if (emailcontroller.text.isEmpty) {
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("Email is Undefined")));
      iserror = true;
    }
    if (phonecontroller.text.isEmpty) {
      scaffoldkey.currentState.showSnackBar(
          new SnackBar(content: Text("Phone Number is Undefined")));
      iserror = true;
    }
    if (passwordcontroller.text.isEmpty) {
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("Password is Undefined")));
      iserror = true;
    }

    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailcontroller.text);

    if (emailValid == false) {
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("Email Format Incorrect")));
      iserror = true;
    }
    return iserror;
  }

  Future<void> addNewUser() async {
    bool isuserExist = false;

    bool iserror = performBasicValidation();
    if (iserror) return;

    await firestoreInstance
        .collection("Customers")
        .where("email", isEqualTo: emailcontroller.text)
        .get()
        .then((value) {
      value.docs.forEach((result) {
        print(result.data());
        print(result.get("email"));
        if (result.get("email").toString().isNotEmpty ) {
          isuserExist = true;
        }
      });
    });

    if (isuserExist == true) {
      print("user already exist");
      scaffoldkey.currentState
          .showSnackBar(new SnackBar(content: Text("User Already Exist")));
      return;
    } else {
      FirebaseFirestore.instance.collection("Customers").add({
        "firstname": firstnamecontroller.text,
        "lastname": lastnamecontroller.text ??= "",
        "email": emailcontroller.text,
        "phonenumber": phonecontroller.text,
        "password": passwordcontroller.text,
      }).then((value) {
        scaffoldkey.currentState
            .showSnackBar(new SnackBar(content: Text("Sign Up Completed")));
        Navigator.pushReplacementNamed(context, Home.classname);
      });
    }

/*


*/
  }
}
