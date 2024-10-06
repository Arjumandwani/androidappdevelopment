import 'dart:convert';

import 'package:ecommercewebsite/WomenTops.dart';
import 'package:ecommercewebsite/elevated.dart';

import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:ecommercewebsite/tops.dart';
import 'package:flutter/material.dart';
import 'modules/NewModel.dart';
import 'modules/PostModel.dart';
import 'package:http/http.dart' as http;
class FashionSale extends StatefulWidget {  @override
  State<FashionSale> createState() => _FashionSaleState();
}

class _FashionSaleState extends State<FashionSale> {
   int _currentIndex = 0;
  List<PostModel>Postlist=[];
  List<NewModel>newmodellist=[];
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
  Future<List<NewModel>>getnewmodel()
  async{
    final response=await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200)
    {
      for (Map i in data){
       newmodellist.add(NewModel.fromJson(i));
      }return newmodellist;
    }else{
      return newmodellist;
    }

  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
     bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.red,
      unselectedItemColor:Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Navigate to the selected screen
          if (index == 0) {Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => FashionSale(),
  ),
);

          
          } else if (index == 1)  {Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => MyApplication(),
  ),
          );  
          
        
          }
          else if (index ==2) {
           Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => MyApplication(),
  ),
          );  
        
          }

          
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
            
          ),
           
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Bag',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favourites',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    body: SafeArea(
      
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children:[
                Visibility(visible: !buttonpressed,
                child: Image.asset('assets/images/Big Banner.png',
                    height:572,width:450,
                fit: BoxFit.cover),
              ),
              Positioned(
                  top:360,
                  child: Text(' Fashion',
                    style: SameTextStyle.heading)),
                Positioned(
                    top:420,
                    child: Text(' sale',
                        style: SameTextStyle.heading)),
                Positioned(
                  left: 15,
                    top:505,
                    child: SizedBox(
                      width: 190,
                      height: 45,
                      child: Visibility(visible: !buttonpressed,
                        child: ElevatedButton(
                          onPressed: (){
                             setState(() {
                               buttonpressed=!buttonpressed;
                               });
                          },child: Text(' check',style:TextStyle(color: Colors.white),),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red
                          ),
                                      ),
                      ),
                    )),
       Visibility(visible: buttonpressed,
           child: Center(
             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
               children: [
               Image.asset('assets/images/Small banner.png',width:450,height:199,fit:BoxFit.cover,),
               SizedBox(height: 25,),
               Text('Sale',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
               Text("Super Summer Sale",style:TextStyle(fontSize: 20,color: Colors.grey),),
               SizedBox(height: 15,),
               SizedBox(
                 height: 15,),
               Container(height: 370,
               child:  FutureBuilder(future: getnewmodel(),
                   builder:(context,snapshot){
                     if(!snapshot.hasData){return Text('loading');}
                     else{
                       return
                         ListView.builder(scrollDirection: Axis.horizontal,
                           itemBuilder: (context,index)
                           {if (newmodellist[index].images != null &&
                               newmodellist[index].images!.length > 1)
                             return Padding(
                               padding: const EdgeInsets.all(15),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Image.network(newmodellist[index].images![1].toString(),height: 250,width: 200,fit: BoxFit.cover,),
                                   Container(width:200,
                                       child: Text(newmodellist[index].title.toString(),style:TextStyle(fontWeight: FontWeight.bold),)),
                                   Text('\$:${newmodellist[index].price.toString()}',style: TextStyle(color:Colors.red),),
                                 ],
                               ),
                             );
                           }
                           ,itemCount: newmodellist.length,);
                     }
                   }
               ),)

             ],),
           ))
           ]
            ),
            SizedBox(height: 20,),
            Text('New',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
            Text("You've never seen it before",style:TextStyle(fontSize: 20,color: Colors.grey),),
            SizedBox(height: 15,),
            Container(height: 550,
              child: FutureBuilder(future: getpostapi(),
                  builder:(context,snapshot){
                if(!snapshot.hasData){return Text('loading');}
                else{
                  return
                      ListView.builder(scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)
                      {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(Postlist[index].image.toString(),height: 300,width: 200,fit: BoxFit.cover,),
                              SizedBox(height: 10,),
                               Text('Ratings:${Postlist[index].rating!.rate.toString()}'),
                              Container(width:200,
                               child:
                              Text(Postlist[index].title.toString(),
                              style:TextStyle(fontWeight: FontWeight.bold),)),
                              Text('Category:${Postlist[index].category.toString()},'),
                              Text('\$:${Postlist[index].price.toString()}',style: TextStyle(color:Colors.red),),
                            ],
                          ),
                        );
                      },itemCount: Postlist.length,);
                }
                  }
              ),
            )

          ],
        ),
      ),
    ),

  );
  }}
              /*   Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment:MainAxisAlignment.start,children: [Expanded(child:Image.asset('assets/images/black.jpg', height:200,width:200),),
                 Expanded(child:Image.asset('assets/images/images.jpg',height:200,width:200,))],),
                 Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
             children:[
              IconButton(icon: Icon(Icons.home),
              onPressed: (){
            
              },
              ),
              IconButton(icon:Icon(Icons.shop),
              onPressed:()
              {
            
              },
              ),
              IconButton(icon:Icon(Icons.badge),
              onPressed:(){
            
              },),
                IconButton(icon:Icon(Icons.favorite),
              onPressed:(){
            
              },),
              IconButton(icon:Icon(Icons.person),
              onPressed:(){
            
              },),
            ],
            ),
            
            */
            
               
                 
        

  


      
      
    
      /*Row(mainAxisAlignment:MainAxisAlignment.spaceAround,
       children:[
        IconButton(icon: Icon(Icons.home),
        onPressed: (){
      
        },
        ),
        IconButton(icon:Icon(Icons.shop),
        onPressed:()
        {
      
        },
        ),
        IconButton(icon:Icon(Icons.badge),
        onPressed:(){
      
        },),
          IconButton(icon:Icon(Icons.favorite),
        onPressed:(){
      
        },),
        IconButton(icon:Icon(Icons.person),
        onPressed:(){
      
        },),
      ],
      ),
      )
  
      
      ElevatedButton(onPressed:()
          {Navigator.push(context,MaterialPageRoute(builder:(context)=> StreetsPage()));

          },
          child:Text('sign up',style:TextStyle(color:Colors.white)),

          ),
    
      
      );
    
      
    
  }
}
     
*/