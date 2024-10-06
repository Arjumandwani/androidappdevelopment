
import 'package:ecommercewebsite/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
      home:  MyCategoriesPage(title: '',),
        );
  });
}
}
class MyCategoriesPage extends StatefulWidget {
   MyCategoriesPage({super.key, required this.title});



  final String title;

  @override
 
  State<MyCategoriesPage> createState() => _MyCategoriesPageState();
}class _MyCategoriesPageState extends State<MyCategoriesPage> {


 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text('Categories'),
      ),
      body:Column(
        children: [
          Container(width:double.infinity,
          
          color:Colors.red,
          child:Center(child: Text('SUMMER SALES  ',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold),)),
          
               
          ),
      /*ListView(children:[ListTile(
        title:Text('New',style:TextStyle(color:Colors.black),),
        trailing:Image.asset('assets/images/jeans.jpg')
       ),
       ListTile(
        title:Text('Clothes',style:TextStyle(color:Colors.black ),),
        trailing:Image.asset('assets/images/necklace.jpg')
       ),
       ListTile(
        title:Text('Shoes',style:TextStyle(color:Colors.black),),
        trailing:Image.asset('assets/images/heels.jpg')
       ),
       ListTile(
        title:Text('Accesories',style:TextStyle(color:Colors.black),),
        trailing:Image.asset('assets/images/bags.jpg')
       ),

        
       ]*/ ElevatedButton(onPressed:()
            {Navigator.push(context,MaterialPageRoute(builder:(context)=> Cat()));
        
            },
            child:Text('sign up',style:TextStyle(color:Colors.white)),
        
            ),  ],
      ),
  
      );
      
  
  }
}