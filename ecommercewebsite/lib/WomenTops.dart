import 'dart:convert';

import 'package:ecommercewebsite/modules/PostModel.dart';
import 'package:ecommercewebsite/myrangeslider.dart';
import 'package:ecommercewebsite/newWomenTops.dart';
import 'package:ecommercewebsite/sales.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WomenTops extends StatefulWidget {
  @override
  State<WomenTops> createState() => _WomenTopsState();
}

class _WomenTopsState extends State<WomenTops> {
  List<PostModel> Postlist = [];
  int _selectedIndex = 1;
  String selectedFilter = '';

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
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'T-shirts',
                        style: TextStyle(
                          color: selectedFilter == 'T-shirts' ? Colors.red : Colors.white,
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
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: Text(
                      'Crop tops',
                      style: TextStyle(
                        color: selectedFilter == 'Crop tops' ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: Text(
                      'Sleeveless',
                      style: TextStyle(
                        color: selectedFilter == 'Sleeveless' ? Colors.red : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Card(
              child: Row(
                children: [
                  Row(
                    children: [
                     IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RangeSliderNew(), // Replace with your actual screen
                ),
              );
            },),
                      
                    ],
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Filters"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Icon(Icons.arrow_drop_up_rounded),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Center(
                                  child: Text(
                                    'Sort By',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Text('Popular', style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Text('Newest', style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Text('Customer Review', style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Text('Price: Lowest to Highest', style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Text('Price: Highest to Lowest', style: TextStyle(fontWeight: FontWeight.bold),),
                                ),
                              
                              ],
                            );
                          },
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewWomen(),
                                ),
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
                                  SizedBox(height: 10,),
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
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag,),
            label: 'Bag'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,),
            label: 'Favorites'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            // Navigate to HomeFashionSale screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FashionSale(),
              ),
            );
          }
          // Handle navigation to different tabs if needed
        },
      ),
    );
  }

  Widget buildFilterTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: selectedFilter == label ? Colors.red : Colors.white,
          ),
        ),
        onTap: () {
          setState(() {
            selectedFilter = label;
          });
        },
      ),
    );
  }
}