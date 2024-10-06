import 'dart:async';

import 'package:flutter/material.dart';
class WhyProviderScreen extends StatefulWidget {
  const WhyProviderScreen({super.key});

  @override
  State<WhyProviderScreen> createState() => _WhyProviderScreenState();
}

class _WhyProviderScreenState extends State<WhyProviderScreen> {
  int count=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer.periodic(Duration(milliseconds:100), (timer) {
      count++;
     // print(count);
      setState(() {
        
      });
     });
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(appBar: AppBar(title:const Text('Subscribe'),
    ),
    body:Column(mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment:CrossAxisAlignment.center,
    children: [
      Center(child:Text(DateTime.now().hour.toString()+" :"+
      DateTime.now().minute.toString()+" :"+DateTime.now().second.toString()+" :",
      style:TextStyle(fontSize:50),),
      ),
       Center(child:Text(count.toString()+" :",
      style:TextStyle(fontSize:50),),
       ),
    ],)
    );
  }
}
