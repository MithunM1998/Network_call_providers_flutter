import 'package:flutter/material.dart';
import 'package:networkcalls_providers/multi.dart';
import 'package:provider/provider.dart';

import 'Data.dart';
import 'Data2.dart';
import 'Get.dart';
import 'PostData.dart';


/*void main(){
  runApp(MyApp());//single provider
}*/
void main(){
  runApp(MultiProvider(providers: [ChangeNotifierProvider<Data2>(create: (_)=>Data2()),ChangeNotifierProvider<PostData>(create: (_)=>PostData())],child:MyApp()));//this is for multiprovider , get method and post method
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*return  ChangeNotifierProvider(create:(context){// this code is for single providers
      return Data();
    },*/

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context){
          return Data();
        }
        ),
        ListenableProvider(create: (context){
          return multi();
        })
      ],
        child:MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text("Provider"),),
            /*body: Consumer<Data>(
                builder:  (context,data,_){
                  return Center(child: Text(data.value()));//this is for single data
                }
            ),*/
            body: Consumer<multi>(
              builder: (context,multi,_){
                return Center(child: Center(
                  child: Column(
                    children: [
                      Text(multi.value),
                      TextField(
                        onChanged: (value){
                         multi.changeValue(value);
                      }
                      ),
                      ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=>Get()));
                      }, child: Text("Next"))

                    ],
                  ),
                ),
                );
              }
            ),
          ),
        ),
    );


  }
}
