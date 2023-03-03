
import 'package:flutter/cupertino.dart';

import 'Get.dart';
import 'model.dart';

class Data2 extends ChangeNotifier{

   model? m;

 fetchData(context) async{
   m=await getData(context);
   notifyListeners();
 }
}