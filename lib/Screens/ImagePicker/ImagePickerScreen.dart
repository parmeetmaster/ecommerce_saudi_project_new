

import 'package:flutter/material.dart';
import 'package:flutter_app_demo_saudi/Provider/ImagePickerProvider.dart';
import 'package:provider/provider.dart';

class ImagePickerScreen extends StatefulWidget {
  static const classname="/ImagePickerScreen";

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Consumer<ImagePickerProvider>(

        builder: (context, value,child) {
          return Column(children: [
            value.image!=null? Image.file(value.image):Container(),
            RaisedButton(child: RaisedButton(child: Text("Image by camera"),),
            onPressed: (){
              value.getImageByCamera();
            },
            ),
            SizedBox(height:50),
            RaisedButton(child: RaisedButton(child: Text("Image by gallary"),),
                onPressed: (){
                  value.getImageByGallary();
                }
            )

          ],);
        }
      )

    );
  }
}
