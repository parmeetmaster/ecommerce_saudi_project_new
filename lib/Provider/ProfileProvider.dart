import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class ProfileProvider extends ChangeNotifier{



  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('Customers');

  String response="Loading";

  Future<void> getData() async {

    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData =await querySnapshot.docs.map((doc) => doc.data()).toList();
    response=allData.toString();
    notifyListeners();
    //print(allData);
  }

  Future<void>  addData() async{
    FirebaseFirestore.instance.collection("Customers").add({
      "name": "john",
      "age": 50,
      "email": "example@example.com",
      "address": {"street": "street 24", "city": "new york"}
    }).then((value){


    });


  }






}