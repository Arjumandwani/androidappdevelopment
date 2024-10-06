import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cat extends StatelessWidget {
  const Cat ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize:const Size(375,812),
      minTextAdapt:true,
      splitScreenMode:true,
      builder:(context,child)
      {return MaterialApp(

   
      title: '',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyCatPage(title: '',),
        );
  });
}
}
class MyCatPage extends StatefulWidget {
   MyCatPage({super.key, required this.title});



  final String title;

  @override
 
  State<MyCatPage> createState() => _MyCatState();

}
class _MyCatState extends State<MyCatPage> {
  final List<String>items=[
    'Tops',
    'Shirts & Blouses',
    'Cardigans & Sweaters',
    'Knitwear',
    'Blazers',
    'Outerwear',
    'Pants',
    'Jeans',
    'Shorts',
    'Skirts',
    'Dresses'


  ];
  


 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text('Categories'),
      ),
      body:Column(
        children: [
          Container(
          height:200,
          
          color:Colors.red,
          child:Center(child: Text('VIEW ALL ITEMS  ',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)))),
       
          Container(child: ListView.builder(itemCount:items.length,itemBuilder: (context, index) =>ListTile(title:Text(items[index],))))])
    );
        
          
               
          
      
  }
}