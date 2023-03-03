import 'dart:convert';
import 'dart:ffi';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Data.dart';
import 'Data2.dart';
import 'Post.dart';
import 'main.dart';
import 'model.dart';
import 'package:http/http.dart' as http;
/*void main(){
  runApp(MultiProvider(providers: [ChangeNotifierProvider<Data2>(create: (_)=>Data2())],child:Get()));//this is for multiprovider , get method and post method
}*/
class Get extends StatelessWidget {
  const Get({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}


class Home extends StatefulWidget {


  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final data=Provider.of<Data2>(context,listen: false);
    data.fetchData(context);
  }
  @override
  Widget build(BuildContext context) {
    final data=Provider.of<Data2>(context);
    return Scaffold(
    appBar: AppBar(title: Text("Get Method"),),
      body: Container(
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(data.m?.fact ?? ''),
              //(data.m?.length ?? '')

              Center(
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>Post()));
                }, child: Text("Next")),
              ),
              Center(
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>MyApp()));
                }, child: Text("Back")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<model?> getData(context) async{

    model? m;

  try{
    final response = await http.get(Uri.parse("https://catfact.ninja/fact"));
    print("working...");
    if(response.statusCode==200){
      final data=json.decode(response.body);
      m=model.fromJson(data);

    }else{
      print('something went wrong check on request code');
    }
  }catch(e){
    print(e.toString());
    print("Not working");
  }

  return m;
}
