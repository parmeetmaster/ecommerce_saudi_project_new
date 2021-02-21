import 'package:uuid/uuid.dart';

class UUIdUtils{

  static var uuid = Uuid();

  UUIdUtils getInstance(){
    return new UUIdUtils();
  }

  getV4Uuid(){
     return uuid.v4();

  }


}