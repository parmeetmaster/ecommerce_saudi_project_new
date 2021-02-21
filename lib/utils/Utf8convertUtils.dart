



import 'dart:convert';

class UtfConvertUtils{

  convert(String m){
   // String m= utf8.encode("क्या है").toString();
    m=m.replaceAll("[","").replaceAll("]","");
    List <String> lstring = m.split(",");
    List <int> lint = lstring.map(int.parse).toList();
    //print(lint);
    m= utf8.decode(lint);
   // print(m);
    return m;


  }
}