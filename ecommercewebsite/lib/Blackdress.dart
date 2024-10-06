import 'package:ecommercewebsite/modules/PostModel.dart';
import 'package:ecommercewebsite/ratingsandreview.dart';
import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:ecommercewebsite/sendreview.dart';
import 'package:flutter/material.dart';
class Blackdress extends StatefulWidget{
  @override
  State<Blackdress> createState() => _BlackdressState();
}

class _BlackdressState extends State<Blackdress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(child: Text('Short dress',style: SameTextStyle.heading)),
      ),body:
    Container(width:double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(top:100.0),
        child: Row(children:[
          GestureDetector(
  onTap: () {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 120,
          // Customize the appearance of the bottom sheet
          child: Center(
            child:  Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(height:50,
              width:double.infinity,
                child: ElevatedButton(
                    onPressed: () {  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Review(),
                                ),
                              );
                      
                    },
                    child: Text('ADD TO CART', style:TextStyle(color:Colors.white)),
                     style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red),
                    /*minimumSize: MaterialStateProperty.all(Size(double.infinity,5000)),*/
                  ),
                          ),
              ),
            ),
        ),
        
        );
        
      },
    );
  },

            child:Column(
              children: [
                Row(mainAxisAlignment:MainAxisAlignment.start,children:[Image.asset('assets/images/frontdress.png',width:200,height:500,),
                Image.asset('assets/images/balckdress.png',width:180,height:400,),
                
                ],
                
                
                
                 
                          /* Image.asset('assets/images/balckdress.png',width:180,height:500,),*/
                          ),
              ],
            ),
          
        
        ),
        
     ] ),
     
    )

        
    ),

    );
  }
}
