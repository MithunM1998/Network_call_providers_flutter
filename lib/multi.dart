import 'package:flutter/material.dart';

class multi extends ChangeNotifier{

  String value="hellow wolrd";

  void changeValue(String newValue){
    value=newValue;
    notifyListeners();
  }


}