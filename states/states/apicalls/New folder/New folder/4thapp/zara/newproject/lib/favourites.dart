import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newproject/models.dart';
import 'package:newproject/myfavouritelist.dart';
import 'package:newproject/provider.dart';
import 'package:provider/provider.dart';



class FavouriteScreen extends StatefulWidget {  @override
State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
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
                return GridView.builder(itemCount:Postlist.length,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent:600), itemBuilder: (context,index){
                    return Consumer<FavouriteProvider>(builder: (context,value,child){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(Postlist[index].image.toString(),
                          ),
                          Container(//width:200,
                              child:
                              Text(Postlist[index].title.toString(),
                                style:TextStyle(fontWeight: FontWeight.bold),)),
                          Text('Category:${Postlist[index].category.toString()},'),
                          Text('\$:${Postlist[index].price.toString()}',style: TextStyle(color:Colors.red),),
                          IconButton(onPressed: (){
                            if(value.ispressed.contains(index)){value.removeitem(index);}
                            else
                              favouriteprovider.additem(index);
                          },
                            icon:value.ispressed.contains(index) ? Icon(Icons.favorite) : Icon(Icons
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
  }
}