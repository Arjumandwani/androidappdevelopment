import 'package:ecommercewebsite/WomenTops.dart';
import 'package:ecommercewebsite/sales.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatefulWidget {
  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  final List<String> categories = [
    'Tops',
    'Shirts',
    'Blouses',
    'Cardigans & Sweaters',
    'Knitwear',
    'Blazers',
    'Outwear',
    'Pants',
    'Jeans',
    'Shorts',
    'Skirts',
    'Dresses',
  ];
  bool isTopsListVisible = false;

  int _selectedIndex = 1; // Added for bottom navigation bar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Categories')),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isTopsListVisible = !isTopsListVisible;
                  });
                },
                child: Text('VIEW ALL ITEMS', style: TextStyle(color: Colors.white)),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
              ),
            ),
          ),
          if (isTopsListVisible)
            Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  children: categories.map((category) {
                    return GestureDetector(
                      onTap: () {
                        // Handle tile click
                        if (category == 'Tops') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WomenTops(),
                            ),
                          );
                        } else {
                          print('Tile clicked: $category');
                        }
                      },
                      child: Container(
                        height: 50,
                        child: ListTile(
                          title: Text(category),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
        ],
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
          BottomNavigationBarItem(icon:Icon(Icons.shopping_bag,),
          label:'Bag'),
            BottomNavigationBarItem(icon:Icon(Icons.favorite,),
          label:'favourites'),

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
                builder: (context) => FashionSale(), // Replace with your screen
              ),
            );
          }

          // Handle navigation to different tabs if needed
        },
      ),
    );
  }
}