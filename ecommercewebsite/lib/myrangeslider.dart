import 'package:ecommercewebsite/brands.dart';
import 'package:ecommercewebsite/mybrands.dart';
import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:flutter/material.dart';

class RangeSliderNew extends StatefulWidget { 
 
  @override
  State<RangeSliderNew> createState() => _RangeSliderNewState();
}

class _RangeSliderNewState extends State<RangeSliderNew> {
  RangeValues values=RangeValues(0.5, 1);
  List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];
   List<String> categories = ['All', 'Women', 'Men', 'Boys', 'Girls'];
      @override
  Widget build(BuildContext context) {
    RangeLabels labels=RangeLabels(values.start.toString(),values.end.toString(),);
    
   return Scaffold
   (
     appBar: AppBar(
          title: Center(child: Text('Filters',style: SameTextStyle.heading,)),
     ),
     
     
    body:Container(height:double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RangeSlider
            ( values: values,
             divisions:10,
            labels:labels,
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
            
            onChanged:(newValue){
               values=newValue;
              setState(() {
             
            
              });
            },
            ),
          ),
          
         
                Container(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Colors",textAlign: TextAlign.start,style: SameTextStyle.heading,),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:2),
                  Container(height:50,
                  width:double.infinity,
                  color:Colors.white,
                    child: Row(
                      children: [
                       
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.black, // Replace with your desired background color
                            ),
                          ),
                           Padding(
                             padding: const EdgeInsets.only(left:8.0),
                             child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.pink, // Replace with your desired background color
                                                       ),
                           ),
                             Padding(
                               padding: const EdgeInsets.only(left:8.0),
                               child: CircleAvatar(
                                                           radius: 20,
                                                           backgroundColor: Colors.red, // Replace with your desired background color
                                                         ),
                             ),
                      
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white, // Replace with your desired background color
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.red, // Replace with your desired background color
                          ),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.grey, // Replace with your desired background color
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.yellow, // Replace with your desired background color
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blueAccent, // Replace with your desired background color
                          ),
                        ),
                      ],
                    ),
                  ),SizedBox(height:50),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Sizes",style: SameTextStyle.heading,),
                      ],
                    ),
                  ),SizedBox(height:20),
    
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                                    height: 60,
                                    width:double.infinity,
                                    color: Colors.white,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: sizes.length,
                                      itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            sizes[index],
                            style: SameTextStyle.heading,
                          ),
                        ),
                      ),
                    );
                                      },
                                    ),
                                  ),
                  ),
                  
                 
                SizedBox(height:10),
               
              Container(
              height: 60,
              color:Colors.white,
              child: Row(
                children: [
                  for (String category in categories.sublist(0, 3))
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            category,
                            style: SameTextStyle.heading,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(color:Colors.white,
              height: 60,
              child: Row(
                children: [
                  for (String category in categories.sublist(3))
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            category,
                            style: SameTextStyle.heading,
                          ),
                        ),
                      ),
                    ),
              
             
               ],
    
              ),
            ),
              Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
    'Brands',
    style: SameTextStyle.heading,
        ),
        GestureDetector(
    onTap: () {
      // Navigate to the next screen when the arrow is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => brands()),
      );
    },
    child: Row(
      children: [
        Text(
          'See All',
          style: SameTextStyle.heading,
        ),
         IconButton(
            icon: Icon(Icons.forward),
            onPressed: () {
              // Navigate to the next screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyBrands()),
              );
            },
          ),
    
      ],
    ),
        ),
      ],
    ),
      ])
    ));
  }
}


                
              
                  
           

              /* Expanded(
                    child: GestureDetector(
                                    onTap: () {
                    double screenHeight = MediaQuery.of(context).size.height;
                    double maxSheetHeight = screenHeight * 0.8;
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight: double.infinity,
                            ),
                            child: Container(
                              width: double.infinity,
                              height:100,
                              padding: EdgeInsets.all(0),
                              color: Colors.white,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(height:30,
                                        width:130,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context); // Close the bottom sheet
                                            },
                                              style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.white),
                                                             ),
                                            
                                            child: Text("Discard",style:TextStyle(color:Colors.black)),
                                          
                                          ),
                                        ),
                                      ),SizedBox(width:90),
                                       Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: Container(height:30,
                                         width:140,
                                           child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context); // Close the bottom sheet
                                            },
                                              style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red),
                                                              ),
                                            child: Text("Apply",style:TextStyle(color:Colors.white)),
                                                                                 ),
                                         ),
                                       ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                                    }
                    ),
                  )
          ]
        )
     )
        ));
   
      
      
  }


      
    
  }*/


    
    
    
    
  
