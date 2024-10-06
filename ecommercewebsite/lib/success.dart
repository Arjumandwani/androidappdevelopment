import 'package:ecommercewebsite/bags.dart';
import 'package:flutter/material.dart';
class success extends StatefulWidget{
  @override
  State<success> createState() => _successState();
}

class _successState extends State<success> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        body: InkWell(
        onTap: () {
          // Navigate to the next screen when the image is tapped
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => bag(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset("assets/images/success.png"),
        ),
      ),
     
      );
    
  }
}