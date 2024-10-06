import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/homepage.dart';
import 'package:statemanagement/provider/anotherprovider.dart';
import 'package:statemanagement/provider/count.dart';
import 'package:statemanagement/provider/count_provider.dart';
import 'package:statemanagement/provider/exampleoneprovider.dart';
import 'package:statemanagement/statefulwidget.dart';
import 'package:statemanagement/whyProvider.dart';
import 'package:statemanagement/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider (
      providers:[
        ChangeNotifierProvider(create:(_)=>CountProvider()),
          ChangeNotifierProvider(create:(_)=>ExampleOneProvider()),
      ],
    child:MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  ExampleOneScreen(),
    ),
    );
  /*  return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  CountExample(),
    );*/
  }
}

