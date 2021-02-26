import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_demo_saudi/Global/FavoriteListItem.dart';
import 'package:flutter_app_demo_saudi/Global/Global.dart';
import 'package:flutter_app_demo_saudi/Provider/FirebaseDemoProvider.dart';
import 'package:flutter_app_demo_saudi/Provider/ProfileProvider.dart';
import 'package:flutter_app_demo_saudi/Screens/SignInScreen/signin.dart';
import 'package:flutter_app_demo_saudi/constantPackage/constStrings.dart';
import 'package:flutter_app_demo_saudi/utils/preference.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  static const classname = "/ProfilePage";

  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    final provider = Provider.of<ProfileProvider>(context,listen: false);
    provider.getFavourites();
    // TODO: implement initState
    super.initState();
  }

  var firestoreInstance = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
   Provider.of<ProfileProvider>(context).getFavourites;
   Provider.of<ProfileProvider>(context).setContext(context);

   String fullname = "";
 try{
   if (Global.user_details.lastname!=null) {
     fullname = Global.user_details.firstname + Global.user_details.lastname;
   }else{
     fullname = Global.user_details.firstname ;
   }

 }catch(E){
   fullname = Global.user_details.firstname ;

 }

    return Scaffold(
        body: Consumer<ProfileProvider>(
          builder: (context, value,child) {

            if(value.list_of_favourite_tiles!=null)
            return new Container(
              color: Colors.white,
              child: new ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      new Container(
                        height: 310.0,
                        color: Colors.white,
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[

                            Padding(
                                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.black,
                                      size: 22.0,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: new Text('Favourites',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              fontFamily: 'sans-serif-light',
                                              color: Colors.black)),
                                    ),
                                   Spacer(),
                                    InkWell(
                                      onTap: (){
                                        Global.user_details=null;
                                        Preference.clear();
                                        Navigator.pushNamedAndRemoveUntil(context, SignInPage.classname, (Route<dynamic> route) => false);
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(right: 20),
                                        child:Text("Log Out"),
                                      ),
                                    )

                                  ],
                                )),
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Stack(
                                  fit: StackFit.loose, children: <Widget>[
                                new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Container(
                                        width: 140.0,
                                        height: 140.0,
                                        decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            image: new ExactAssetImage(
                                                'assets/images/as.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 90.0, right: 100.0),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        new CircleAvatar(
                                          backgroundColor: Colors.red,
                                          radius: 25.0,
                                          child: new Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )),
                              ]),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 20),
                                child: Text("${fullname}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800),)),
                            ),
                            Center(
                              child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text("Total Favorities: ${value.favcount}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w800),)),
                            ),
                            Container(child: Divider(thickness: 3,))
                          ],
                        ),
                      ),
                      Column(children:value.list_of_favourite_tiles,)
                    ],
                  ),

                ],
              ),
            );
            else
              return Container(child: Center(child: CircularProgressIndicator(),),);
          }
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
