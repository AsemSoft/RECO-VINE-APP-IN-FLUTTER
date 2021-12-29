
import 'dart:convert';
import 'dart:typed_data';

class Utility{

  static List <String>imageName=[];
  static String name='results';
  static String base64String(Uint8List data){
    return base64Encode(data);
  }

  static Uint8List image(String base64String){
    return base64Decode(base64String);
  }

}