import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hivehomework/packages/exaple.dart';
import 'package:hivehomework/packages/homework11.dart';
import 'package:hivehomework/packages/homework12.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('pdp');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage2(),
      routes: {
        HomePage.id:(context)=>HomePage(),
        HomePage2.id:(context)=>HomePage2(),
        HomePage3.id:(context)=>HomePage3(),


      },
    );
  }
}
