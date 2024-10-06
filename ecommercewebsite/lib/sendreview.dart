

import 'package:ecommercewebsite/mybrands.dart';
import 'package:ecommercewebsite/ratingsandreview.dart';
import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:ecommercewebsite/womentopsapi.dart';
import 'package:flutter/material.dart';
class Review extends StatefulWidget{
  @override
  State<Review> createState() => _reviewState();
}

class _reviewState extends State<Review> {
 
  @override
  Widget build(BuildContext context) {
    void showReviewBottomSheet(int starRating) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Container(
        width:double.infinity,
        height:100,
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
           
            
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width:double.infinity,
                height:50,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>Ratings(), 
              ),
            );
                  },
                  style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red)),
                  child:Text("SEND REVIEW",style: (TextStyle(color:Colors.white))),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

    
  return Scaffold(
    body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:70.0),
            child: Text("What is your rate?",style:SameTextStyle.heading),
          ),
          
          
                
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => GestureDetector(
      onTap: () {
        showReviewBottomSheet(index + 1); // Index + 1 to get the star rating (1 to 5)
      },
      
       child:      Padding(
         padding: const EdgeInsets.all(16.0),
         child: Icon(Icons.star_outline, size: 30, color: Colors.grey),
       ),
            
                   ),
            ),
           )
            ),
            Padding(
              padding: const EdgeInsets.only(left:80.0),
              child: Row(children:[Text("Please share your opinion",style:SameTextStyle.heading,)]),

            ),
            Padding(
              padding: const EdgeInsets.only(left:80.0),
              child: Row(children:[Text("about the product",style:SameTextStyle.heading)],),
            ),
       
       Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                maxLines: 10, // Adjust the number of lines based on your preference
                decoration: InputDecoration(
                  hintText: 'Type your review here...',
                  border: OutlineInputBorder( borderRadius: BorderRadius.zero,),
                ),
                          ),
              ),
            ), ]
        
                   
      )
            
         );
         
      
            
              
          
              
      
  }
}