import 'dart:convert';

import 'package:ecommercewebsite/bagscreen.dart';
import 'package:ecommercewebsite/modules/PostModel.dart';
import 'package:ecommercewebsite/myrangeslider.dart';
import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewWomen extends StatefulWidget {
  @override
  State<NewWomen> createState() => _WomenTopsState();
}

class _WomenTopsState extends State<NewWomen> {
  List<PostModel> Postlist = [];
  int _selectedIndex = 1;

  Future<List<PostModel>> getpostapi() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Postlist.add(PostModel.fromJson(i));
      }
      return Postlist;
    } else {
      return Postlist;
    }
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
          Icon(Icons.menu),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Women's tops ",
                      style: SameTextStyle.heading,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'T-shirts',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: Text(
                      'Crop tops',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewWomen(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: Text(
                      'Sleeveless',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Card(
              child: Row(
                children: [
                  Icon(Icons.menu),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Filters"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 70.0),
                    child: Icon(Icons.arrow_drop_up_rounded),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RangeSliderNew(),
                          ),
                        );
                      },
                      child: Text("Price lowest to high"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50.0),
                    child: Icon(Icons.menu),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: Container(
                    height: 550,
                    child: FutureBuilder(
                      future: getpostapi(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Text('loading');
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  // Show bottom sheet on tapping API product
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 80,
                                        // Customize the appearance of the bottom sheet
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              // Handle bottom sheet button tap
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => BagScreen(selectedProduct: Postlist[index]),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              'ADD TO CART',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                            style: ButtonStyle(
                                              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                                              minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        Postlist[index].image.toString(),
                                        height: 300,
                                        width: 200,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(height: 10),
                                      Text('Ratings:${Postlist[index].rating!.rate.toString()}'),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          Postlist[index].title.toString(),
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text('Category:${Postlist[index].category.toString()},'),
                                      Text(
                                        '\$:${Postlist[index].price.toString()}',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: Postlist.length,
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (index) {
          // Handle bottom navigation bar item tap
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}