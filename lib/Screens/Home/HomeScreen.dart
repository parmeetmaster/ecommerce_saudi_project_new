import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Provider/DetailsScreenProvider.dart';
import 'package:flutter_app_demo_saudi/Provider/HomeProvider.dart';
import 'package:flutter_app_demo_saudi/Screens/ImagePicker/ImagePickerScreen.dart';
import 'package:flutter_app_demo_saudi/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';
import '../Firebasedemopack/FirebaseDemo.dart';

class Home extends StatefulWidget {
 static const classname="/Home";
  @override
  _HomeState createState() => _HomeState();
}

CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('Customers');

Future<void> getData() async {
  // Get docs from collection reference
  QuerySnapshot querySnapshot = await _collectionRef.get();

  // Get data from docs and convert map to List
  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  print(allData);
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // its used to reset upcoming screen
    final provider = Provider.of<HomeProvider>(context);
    provider.setContext(context);
    provider.initload();
    var size = MediaQuery.of(context).size;
    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    final double itemWidth = size.width / 2;
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return Scaffold(
        key: _scaffoldKey,
        appBar: MyAppBar(scaffoldKey: _scaffoldKey),
        body: Container(
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) {
                value.onStartScroll(scrollNotification.metrics);
              } else if (scrollNotification is ScrollUpdateNotification) {
                value.onUpdateScroll(scrollNotification.metrics);
              } else if (scrollNotification is ScrollEndNotification) {
                value.onEndScroll(scrollNotification.metrics);
              }
            },
            child: ((){
              if(value.isloading==true){
             return   Container(child: Center(child: CircularProgressIndicator(),),);
              }else{
                return SingleChildScrollView(
                  controller: value.scrollcontrollerhome,
                  child: Column(
                    children: value.listofProducts,
                  ),
                );
              }

            }()),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.remove_red_eye),
              label: 'Detect Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: value.currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap: value.onbottomOptionClick,
        ),
      );
    });
  }

  Widget _buildGridTitle() {
    return Container(
      margin: new EdgeInsets.all(1.0),
      child: Card(
        child: Column(
          children: [
            Image.network(
                "https://previews.123rf.com/images/good24/good241704/good24170400019/76069863-the-living-room-is-furnished-with-furniture-s-color-of-love-sample-of-furniture-such-as-pillows-sofa.jpg"),
            Text("Skirt")
          ],
        ),
      ),
    );
  }
}
