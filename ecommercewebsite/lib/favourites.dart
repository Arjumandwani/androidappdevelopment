import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommercewebsite/modules/PostModel.dart';
import 'package:ecommercewebsite/favouritesScreen.dart';

class Favourites extends StatefulWidget {
  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<PostModel> postList = [];
  List<bool> isFavoriteList = [];
  List<PostModel> favoriteItems = [];

  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        postList.add(PostModel.fromJson(i));
        isFavoriteList.add(false);
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteScreen(
                    favoriteItems: favoriteItems,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: FutureBuilder(
          future: getPostApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Loading');
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 100.0,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        postList[index].image.toString(),
                        height: 90,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 2),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          postList[index].title.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '\$:${postList[index].price.toString()}',
                        style: TextStyle(color: Colors.red),
                      ),
                      IconButton(
                        icon: isFavoriteList[index]
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border),
                        onPressed: () {
                          setState(() {
                            isFavoriteList[index] = !isFavoriteList[index];

                            if (isFavoriteList[index]) {
                              favoriteItems.add(postList[index]);
                            } else {
                              favoriteItems.remove(postList[index]);
                            }
                          });
                        },
                      ),
                    ],
                  );
                },
                itemCount: postList.length,
              );
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
         unselectedItemColor:Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2, // Set the index to highlight "Favourites"
        selectedItemColor: Colors.red,
        onTap: (index) {
          // Handle taps on the bottom navigation bar items
          if (index == 0) {
            // Navigate to the Home screen
            // You can replace this with the actual screen you want to navigate to
          } else if (index == 1) {
            // Navigate to the Cart screen
            // You can replace this with the actual screen you want to navigate to
          } else if (index == 3) {
            // Navigate to the Profile screen
            // You can replace this with the actual screen you want to navigate to
          }
        },
      ),
    );
  }
}