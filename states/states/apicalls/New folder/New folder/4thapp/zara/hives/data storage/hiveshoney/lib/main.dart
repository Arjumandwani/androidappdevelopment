import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    Directory document=await getApplicationDocumentsDirectory();
  Hive.init(document.path);
   await Hive.openBox<String>("friends");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Box<String> friendsBox;
  final TextEditingController _idController=TextEditingController();
 final TextEditingController _nameController=TextEditingController();
   



  @override
  void initState()
  {
    super.initState();
    friendsBox=Hive.box<String>("friends");
  }
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:Column(children: [Center(child:ElevatedButton(child:Text("Show"),onPressed:(){},),),
      Container(child: Row(mainAxisAlignment:MainAxisAlignment.spaceAround,children:[ElevatedButton(onPressed:(){showDialog(context: context,builder: (_){return Dialog();});}, child: Text("Add New"))
      )),ElevatedButton(onPressed:(){showDialog(context: context, builder:(_){return Dialog(
        child:Container(child:Column(mainAxisSize:MainAxisSize.min,children:[TextField(controller:_idController,),SizedBox(height:16),
        TextField(controller:_nameController,),
        SizedBox(height:16),
        ElevatedButton(onPressed: (){}, child:Text("submit"))]))
      );});}, child:Text("Update"),),
      ElevatedButton(onPressed: (){
        final key=_idController.text;
        final value=_nameController.text;
        friendsBox.put(key,value);
        Navigator.pop(context);
      }, child:Text(' Delete'))],)  
    );
  }
}
