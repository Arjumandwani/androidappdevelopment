import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ecommercewebsite/forgotten.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      home:  MyLoginPage(title: '',),
        );
  });
}
}
class MyLoginPage extends StatefulWidget {
   MyLoginPage({super.key, required this.title});

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
  State<MyLoginPage> createState() => _MyLoginPageState();
}class _MyLoginPageState extends State<MyLoginPage> {

  var emailtext=TextEditingController();
  var passwordtext=TextEditingController();
  final formkey=GlobalKey<FormState>();

 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(mainAxisAlignment:MainAxisAlignment.center,
              children: [
                Form(child:Column(mainAxisAlignment:MainAxisAlignment.start,children:[Text('LOGIN',style:SameTextStyle.heading),
                 TextFormField(controller:emailtext,
                    decoration:InputDecoration( label:Text('email'),
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
                    SizedBox(height:16),
                      TextFormField(controller:passwordtext,
                    validator:(value){
                    
                      if(value==null )
                      {
                        return "please enter correct password";
                      }
                      else{
                        return null;
                      }
                    },
                      decoration:InputDecoration( label:Text('Password'),
                        border:OutlineInputBorder(borderRadius:BorderRadius.zero),
                    ),
                
                    ),
                    SizedBox(height:16),
                     Row(
                      mainAxisAlignment:MainAxisAlignment.end,children:[
                      Text('Forgot your password'),
                    Container(
                      child: IconButton(
                                  icon:Icon (Icons.arrow_forward,color:Colors.red,),
                                  onPressed: () {
                                    Navigator.push(context,MaterialPageRoute(builder:(context)=> MyForgotPage(title: 'forgottenPage',)));
                           
                                  },
                               
                      ),
                    )
                    ],
                     ),
                     SizedBox(height:16),
                       Container(width:double.infinity,
                         child: ElevatedButton(onPressed:()
                                   {Navigator.push(context,MaterialPageRoute(builder:(context)=> MyForgotPage(title: 'forgottenPage',)));
                         
                                   },
                                   style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red)),
                                   child:Text('LOGIN',style: TextStyle(color: Colors.white),),
                         
                                   ),
                       ),
                       SizedBox(height:120,),
                     Center(
                       child: Row(mainAxisAlignment: MainAxisAlignment.center,children:[Text("Or sign up with a social account"),
                         ],),
                     ),
                
                     Row(mainAxisAlignment:MainAxisAlignment.center,children:[Image.asset('assets/images/Google.png'),
                       Image.asset('assets/images/Facebook.png'),
                     
                     ]),
                ],
                )
                
                  
                   
                
                
                
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
