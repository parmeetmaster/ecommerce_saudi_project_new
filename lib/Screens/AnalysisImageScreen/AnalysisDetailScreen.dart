

import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Provider/AnalysisProvider.dart';
import 'package:flutter_app_demo_saudi/model/AnalysisDataHolder.dart';
import 'package:provider/provider.dart';

class AnalysisImageScreen extends StatefulWidget {
   static const String classname="/AnalysisImageScreen";
  @override
  _AnalysisImageScreenState createState() => _AnalysisImageScreenState();
}

class _AnalysisImageScreenState extends State<AnalysisImageScreen> with RouteAware {
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<AnalysisScreenProvider>(context);
    provider.setContext(context);
    AnalysisDataHolder args = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      body: Consumer<AnalysisScreenProvider>(
        builder: (context, value,child) {
          return FutureBuilder(
            future: value.analysisImageUsingBase64(args.image),
            builder: (context, snapshot) {
             return ((){
                if(snapshot.hasData){
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          height: MediaQuery.of(context).size.height*0.6,
                          width:MediaQuery.of(context).size.width,
                          child: Image.file(args.image,fit:BoxFit.contain)),
                      Text("Product name",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
                      Container(
                        height:MediaQuery.of(context).size.height*0.35 ,
                        child: SingleChildScrollView(
                            child: Column(children:value.listofProducts,)),
                      )
                    ],);
                }else{
                 return Container(child: Center(child: CircularProgressIndicator(),),);
                }
              }());
            }
          );
        }
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    print('*** Entering screen:');
  }

  @override
  void didPush() {
    print('*** Entering screen:');
  }

  void didPushNext() {
    print('*** Leaving screen:');

  }

  @override
  void didPop() {
    print('*** Going back, leaving screen:');

  }

  @override
  void didPopNext() {
    print('*** Going back to screen:');
  }
}



