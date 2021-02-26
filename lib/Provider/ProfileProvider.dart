import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_demo_saudi/Global/FavoriteListItem.dart';
import 'package:flutter_app_demo_saudi/Global/Global.dart';
import 'package:flutter_app_demo_saudi/model/product_model.dart';

class ProfileProvider extends ChangeNotifier{



  CollectionReference _collectionRef =
  FirebaseFirestore.instance.collection('Customers');

  String response="Loading";
List<Results> results=[];
  List<dynamic> list_of_favourites;
  List<Widget> list_of_favourite_tiles;
  BuildContext context;

  var favcount=0;
  getFavourites() async {

    QuerySnapshot snap = await FirebaseFirestore.instance
        .collection("Favourite")
        .where("email", isEqualTo: "${Global.user_details.email}")
        .get();
    int snapsize= snap.size;
    if(snapsize>0){
      String document = snap.docs[0].id;
      print("document id is${document}");
     list_of_favourites=   snap.docs[0].get("favlist");
      list_of_favourite_tiles=[];
int k=0;
      for(dynamic data in list_of_favourites){
        list_of_favourite_tiles.add(FavouriteListItem(result:Results.fromJson(data),index:k,removefunction: removeFavourite,));
        //results.add(Results.fromJson(res));
k++;
      }
      favcount=k;
      print(list_of_favourite_tiles.length);

    }else if(snapsize<=0){
      list_of_favourite_tiles=[];
      list_of_favourite_tiles.add(Container(child: Text("No favourites Selected"),));
      notifyListeners();
    }


    notifyListeners();
    //print(allData);
  }

  removeFavourite(int index){
    list_of_favourites.removeAt(index);
    list_of_favourite_tiles=[];
    int k=0;
    for(dynamic data in list_of_favourites){
      list_of_favourite_tiles.add(FavouriteListItem(result:Results.fromJson(data),index:k,removefunction: removeFavourite,));
      //results.add(Results.fromJson(res));
      k++;
    }
    favcount=k;
    removeFromFirebase();
    notifyListeners();
  }

removeFromFirebase()async{
  QuerySnapshot snap = await FirebaseFirestore.instance
      .collection("Favourite")
      .where("email", isEqualTo: "${Global.user_details.email}")
      .get();
  int snapsize= snap.size;
  if(snapsize>0){
    String document = snap.docs[0].id;
    print("document id is${document}");

    FirebaseFirestore.instance
        .collection("Favourite")
        .doc(document)
        .update({"email": "${Global.user_details.email}",
      "favlist":list_of_favourites
    });
  }
}

  void setContext(BuildContext mcontext) {
    this.context=context;

  }




}