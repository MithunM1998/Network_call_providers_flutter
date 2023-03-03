
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:networkcalls_providers/Get.dart';
import 'package:networkcalls_providers/PostData.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'PostModel.dart';
import 'dart:convert' as convert;
class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home2(),
    );
  }
}

class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {


  @override
  Widget build(BuildContext context) {
    final data=Provider.of<PostData>(context);

    var texteditingcontroller=TextEditingController();
    var ideditcontroller=TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text("Post method"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(decoration: InputDecoration(hintText: "Enter title"),controller: texteditingcontroller,),
          TextField(decoration:InputDecoration(hintText: "Enter id"),controller: ideditcontroller,),
          TextButton(onPressed: (){
            data.sendData(context,texteditingcontroller.text.toString(),ideditcontroller.text.toString());
          }, child: Text("post"))
        ],
      ),
    );
  }
}


Future<PostModel> postData(BuildContext context,String title,String userId)async{
  var dataInput={"title":title,"userId":userId};

  final response=await http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"),headers: {"Content-type":
      "application/x-www-form-urlencoded"},encoding: convert.Encoding.getByName("utf-8"),
  body: dataInput);

  if(response.statusCode==201){
    print(response.body);
    print(response.statusCode);
    return PostModel.fromJson(convert.json.decode(response.body));
  }else
    {
      throw Exception('Something went wrong');
    }
}