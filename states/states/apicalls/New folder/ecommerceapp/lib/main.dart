
//import 'package:ecommercewebsite/login.dart';
//import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:ecommercewebsite/login.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize:Size(375,812),
      minTextAdapt:true,
      splitScreenMode:true,
      builder:(context,child)
      {return MaterialApp(

   
      title: '',
      theme: ThemeData(
       
      ),
      
        );
  });
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
  var nametxt=TextEditingController();
  var emailtxt=TextEditingController();
  var passtxt=TextEditingController();
  final formkey=GlobalKey<FormState>();

 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text(widget.title),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Form(child: Column(
                mainAxisAlignment:MainAxisAlignment.start,children: [
               /*Text('SIGN  UP',style:SameTextStyle.heading),*/
                TextFormField(
                  decoration:InputDecoration( label:Text('Name'),
                  border:OutlineInputBorder(borderRadius:BorderRadius.zero),
                  
                  ),
                  validator:(value){
                  if(value==null || value.trim().isEmpty||!value.contains('@'))
                  {
                    return "please enter valid name";
                  }
                    else{
                      return null;
                    }
                  },
                ),
                /*  Row(children: [
                    Text('already have an  account'),
                    Icon(Icons.arrow_forward),
                  ],),*/
                  
                SizedBox(height:16),
              
                TextFormField(
                  controller:emailtxt,
                  
                  validator:(value){
              if(value==null || value.trim().isEmpty)
              {
                return "please enter valid email";
              }
              else{return null;}
                  },
              
                  decoration:InputDecoration( label:Text('Email'),
                  border:OutlineInputBorder(borderRadius:BorderRadius.zero),
                  ),
                ),
                SizedBox(height:16),
                  TextFormField(controller:passtxt,
                  validator:(value){
                  
                    if(value==null )
                    {
                      return "please enter correct password";
                    }
                    else{
                      return null;
                    }
                  },
                    decoration:InputDecoration( label:Text('password'),
                    border:OutlineInputBorder(borderRadius:BorderRadius.zero),
                  ),
              
                  ),
                  SizedBox(height:16),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.end,children:[
                    Text('Already have an  account'),
                    Icon(Icons.arrow_forward,color:Colors.red,),
                  ],),
                  SizedBox(height:16),
              
                 /*  Container(
                    width:double.infinity,
                     child: (onPressed:()
                              /* {Navigator.push(context,MaterialPageRoute(builder:(context)=> MyLoginPage(title: 'login',)));
                     
                               },*/
                      style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red)),
                               
                     
                               child:Text('SIGN UP',style:TextStyle(color:Colors.white)),
                     
                               ),
                   ), */
                   SizedBox(height:140),
                   Column(mainAxisAlignment:MainAxisAlignment.end,
                     children: [
                       Center(
                         child: Row(mainAxisAlignment: MainAxisAlignment.center,children:[Text("Or sign up with a social account"),
                         ],),
                       ),
                     ],
                   ),
                   Row(mainAxisAlignment:MainAxisAlignment.center,children:[Image.asset('assets/images/Google.png'),
                   Image.asset('assets/images/Facebook.png'),
                   ])],
               
              
              
                ),
              ),
            ],
          ),
        ),
      )
      
        
    );
      
       // This trailing comma makes auto-formatting nicer for build methods.
  }
}
   