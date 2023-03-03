
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'Post.dart';


class PostData extends ChangeNotifier{
  late PostData post;

  sendData(context,title,userId) async{
    try{
      post= (await postData(context,title,userId)) as PostData;
    }catch(e){

    }


    notifyListeners();
  }
}