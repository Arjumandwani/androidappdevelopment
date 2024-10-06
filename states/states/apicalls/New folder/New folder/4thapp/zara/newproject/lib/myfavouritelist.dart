import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:newproject/models.dart';
import 'package:newproject/provider.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class MyFavouriteList extends StatefulWidget {  @override
State<MyFavouriteList> createState() => _MyFavouriteListState();
}

class _MyFavouriteListState extends State<MyFavouriteList> {
  List<PostModel>Postlist=[];
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
  @override
  Widget build(BuildContext context) {
    final favouriteprovider =Provider.of<FavouriteProvider>(context,listen: false);
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>MyFavouriteList()));}
                , child: Icon(Icons.favorite)),
            SizedBox(width: 20,)
          ],
        ),

        body:
        SingleChildScrollView(
            child: FutureBuilder(future: getpostapi(),
                builder:(context,snapshot){
                  if(!snapshot.hasData){return Text('loading');}
                  else{
                    return GridView.builder(itemCount:favouriteprovider.ispressed.length,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent:600),
                        itemBuilder: (context,index){ final int postIndex = favouriteprovider.ispressed[index];
                          return Consumer<FavouriteProvider>(builder: (context,value,child){
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(Postlist[postIndex].image.toString(),
                                ),
                                Container(//width:200,
                                    child:
                                    Text(Postlist[postIndex].title.toString(),
                                      style:TextStyle(fontWeight: FontWeight.bold),)),
                                Text('Category:${Postlist[postIndex].category.toString()},'),
                                Text('\$:${Postlist[postIndex].price.toString()}',style: TextStyle(color:Colors.red),),
                                IconButton(onPressed: (){
                                  favouriteprovider.additem(index);
                                },
                                    icon:value.ispressed.contains(postIndex) ? Icon(Icons.favorite) : Icon(Icons
                                        .favorite_border_outlined)
                                )
                              ],
                            );
                          },);

                        }
                    );}
                }
            )
        )
    );

  }}