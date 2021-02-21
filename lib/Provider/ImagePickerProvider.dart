

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier{
  File image;
  final picker = ImagePicker();

  Future getImageByCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
notifyListeners();
  }

  Future getImageByGallary() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
    } else {
      print('No image selected.');
    }
    notifyListeners();
  }


}