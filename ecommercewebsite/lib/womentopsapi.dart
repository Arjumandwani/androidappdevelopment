/*import 'dart:convert';
import 'package:ecommercewebsite/ratingsandreview.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


import 'package:ecommercewebsite/WomenTops.dart';
import 'package:ecommercewebsite/modules/PostModel.dart';
import 'package:ecommercewebsite/newWomenTops.dart';
import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Sizes extends StatefulWidget{
  @override
  State<Sizes> createState() => _SizesState();
}

class _SizesState extends State<Sizes> {
   List<PostModel>Postlist=[];
   bool buttonpressed=false;
  Future<List<PostModel>>getpostapi()
  async{
    final response=await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200)
      {
        for (Map i in data){
          Postlist.add(PostModel.fromJson(i));
        }return Postlist;
      }else{
      return Postlist;
    }
  }
  void _showBottomSheet(PostModel post) {
  
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(width:double.infinity,
      height:double.infinity,
        // Customize the appearance of your bottom sheet
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("What is your rate?"),
              Padding(
         padding: const EdgeInsets.all(16.0),
         child: Center(
           child: Row(
             children: [
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Icon(Icons.star_outline, size: 30, color: Colors.grey),
               ),
                 Padding(
           padding: const EdgeInsets.all(16.0),
           child: Icon(Icons.star_outline, size: 30, color: Colors.grey),
                  ),
           Padding(
           padding: const EdgeInsets.all(16.0),
           child: Icon(Icons.star_outline, size: 30, color: Colors.grey),
                  ),
           Padding(
           padding: const EdgeInsets.all(16.0),
           child: Icon(Icons.star_outline, size: 30, color: Colors.grey),
                  ),
           Padding(
           padding: const EdgeInsets.all(16.0),
           child: Icon(Icons.star_outline, size: 30, color: Colors.grey),
                  ),
             ],
           ),
         ),
       ),
       Center(child: Padding(
         padding: const EdgeInsets.only(left:80.0),
         child: Row(children:[Text("Please share your opinion",style:SameTextStyle.heading)]),
       )),
       Center(child: Padding(
         padding: const EdgeInsets.only(left:100.0),
         child: Row(children:[Text("about the product",style: SameTextStyle.heading)]),
       )),

          Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                maxLines: 5, // Adjust the number of lines based on your preference
                decoration: InputDecoration(
                  hintText: 'Type your review here...',
                  border: OutlineInputBorder( borderRadius: BorderRadius.zero,),
                ),
                          ),
                          
              ),
              
            ),  
              Container(height:20,
              width:20,
                child: ElevatedButton(
                  onPressed: () {
                             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ratings()),
                            );      // Close the bottom sheet
                  },
                  style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red)),
                  child:Text("SEND REVIEW",style: (TextStyle(color:Colors.white))),
                ),
              ),   
            // Add more details as needed
          ],
        ),
      );
    },
  );
}
 
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold(
              appBar: AppBar(
          
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Add your search functionality here
              },
            ),
          ]
              ),
      body:
      Column(
        children: [Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Text("Women's tops ",style:SameTextStyle.heading,),
            ],
          ),
        ),
     Row(
     children: [    Padding(
       padding: const EdgeInsets.all(8.0),
       child: ElevatedButton(onPressed:(){}, style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.black)),
        child:Padding(
         padding: const EdgeInsets.only(left:8.0),
         child: Text(
             'T-shirts',
             style: TextStyle(
         color:Colors.white,
             ),
           ),
           
           
       ), ),
     ),
   
       Padding(
         padding: const EdgeInsets.all(8.0),
         child: ElevatedButton(onPressed:(){}, style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.black)),
          child:Text(
          'Crop tops',
          style: TextStyle(
            color:Colors.white,
          ),
           ), ),
       ),
     
   
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: ElevatedButton(onPressed:(){
       Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewWomen(),
                              ),
                            );
     },  style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.black)),
     child:Text(
      'Sleeveless',
      style: TextStyle(
        color:Colors.white,
      )
       
       ), ),
   ),
  
     ]
   ),

          Container(
            height: 550,
                  child: FutureBuilder(future: getpostapi(),
                      builder:(context,snapshot){
                    if(!snapshot.hasData){return Text('loading');}
                    else{
                      return
                          Padding(
                            padding: const EdgeInsets.only(top:70.0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(onTap: () {
    
    _showBottomSheet(Postlist[index]);
  },
                                        child: Image.network(
                                          Postlist[index].image.toString(),
                                          height: 300,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      RatingBar.builder(
                                        initialRating: Postlist[index].rating!.rate!.toDouble(),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 20,
                                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          // Handle the rating update if needed
                                        },
                                      ),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          Postlist[index].title.toString(),
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text('Category: ${Postlist[index].category.toString()}'),
                                      Text('\$:${Postlist[index].price.toString()}',
                                          style: TextStyle(color: Colors.red),
                                      ),SizedBox(height:10),
                                      Text(
              'Review: Such a nice product',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: Postlist.length,
                            ),
                          );
                    }
                      }
                  )
          )
        ]
      )
    );
  }
}*/