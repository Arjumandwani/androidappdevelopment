import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommercewebsite/sales.dart';



class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

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
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyForgotPage(title: '',),
        );
  });
}
}
class MyForgotPage extends StatefulWidget {
   MyForgotPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  // ignore: no_logic_in_create_state
  State<MyForgotPage> createState() => _MyForgotPageState();
}class _MyForgotPageState extends State<MyForgotPage> {

  var mailtext=TextEditingController();
 
  final formkey=GlobalKey<FormState>();
  
  get children => null;

 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text(widget.title),
      ),
      body: 
    
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Form(child:Column(mainAxisAlignment:MainAxisAlignment.start,children:[Text('Forgot password',style:SameTextStyle.heading),
              SizedBox(height:100),
              Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [Text("Please enter your email address .You will recieve a link to create a new password via email"),/*Form(child:Column(mainAxisAlignment:MainAxisAlignment.start,children:[Text('Login',style:SameTextStyle.heading),*/
                SizedBox(height:16),
                 Column(crossAxisAlignment:CrossAxisAlignment.center,
                   children: [
                     TextFormField(controller:mailtext,
                        decoration:InputDecoration( label:Text('Email'),
                         border:OutlineInputBorder(borderRadius:BorderRadius.zero),
                        ), 
                       
                        validator:(value){
                             if(value==null || value.trim().isEmpty)
                             {
                      return "please enter valid email";
                             }
                             else{return null;}
                        },
                        ),
                   ],
                 ),
                 SizedBox(height:80),
                  
                 Container(width:double.infinity,
                   child: ElevatedButton(onPressed:()
                      {Navigator.push(context,MaterialPageRoute(builder:(context)=> FashionSale()));
                                   
                      },
                       style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red)),
                      child:Text('send',style:TextStyle(color:Colors.white )),
                                   
                      ),
                 )
                ]
                ),]
              ),
              ),
              
                  
                     ] ),
          ),
        ) ;
  }
}
    
        
   

      

 