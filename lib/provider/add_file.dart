import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddFile extends ChangeNotifier {
  List<File> imageFile = [];

  addImage(List <File> img) {
    imageFile = img;
    notifyListeners();
  }

  deleteImage(List <File> img) {


  img.clear();
  notifyListeners();

   /*  for (int i = 0; imageFile.length>=i; i++) {
      imageFile.remove(img[i]);
      notifyListeners();
    }*/

  }


      notifyListeners();


  }





