import 'package:ecommercewebsite/myProfile.dart';
import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:ecommercewebsite/success.dart';
import 'package:flutter/material.dart';
class bag extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(body:Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top:100.0),
          child: Center(child: Image.asset("assets/images/bags.png")),
        ),SizedBox(height:100),
      
    
    Center(
      child: Padding(
        padding: const EdgeInsets.only(left:150.0),
        child: Row(
          children: [
            Text("Success",style:SameTextStyle.heading),
            
          ],),
      ),
    ),SizedBox(height:10),
    Padding(
      padding: const EdgeInsets.only(left:120.0),
      child: Row(children:[Text("Your order will be delivered soon")]),
    ),
      Padding(
        padding: const EdgeInsets.only(left:120.0),
        child: Row(children: [Text("Thankyou for choosing our app")],),
      ),
      SizedBox(height:180),

    
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(onPressed: () {  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Profile())
      );
         },style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red)),child:Text("CONTINUE SHOPPING",style:(TextStyle(color:Colors.white)))),
    )],),

    );
    
    
  }

}