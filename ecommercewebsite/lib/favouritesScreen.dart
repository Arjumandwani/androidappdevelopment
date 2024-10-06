import 'package:flutter/material.dart';
import 'package:ecommercewebsite/modules/PostModel.dart';
import 'package:ecommercewebsite/bagscreen.dart';

class FavoriteScreen extends StatefulWidget {
  final List<PostModel> favoriteItems;

  FavoriteScreen({required this.favoriteItems});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Items'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 200.0,
        ),
        itemCount: widget.favoriteItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  widget.favoriteItems[index].image.toString(),
                  height: 40,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 10),
                Text('Ratings: ${widget.favoriteItems[index].rating?.rate.toString() ?? 'N/A'}'),
                Container(
                  width: 200,
                  child: Text(
                    widget.favoriteItems[index].title?.toString() ?? 'No Title',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text('Category: ${widget.favoriteItems[index].category?.toString() ?? 'N/A'}'),
                Text(
                  '\$:${widget.favoriteItems[index].price?.toString() ?? 'N/A'}',
                  style: TextStyle(color: Colors.red),
                ),
                IconButton(
                  onPressed: () {
                    // Call the callback function to add the item to BagScreen using setState
                    setState(() {
                      BagScreen.addItemToBag(widget.favoriteItems[index]);
                    });
                    // Navigate to BagScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BagScreen(),
                      ),
                    );
                  },
                  icon: Icon(Icons.shopping_bag, color: Colors.orange, size: 40.0),
                ),
              ],
            ),
          );
        },
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
            icon: Icon(Icons.shopping_bag),
            label: 'Bag',
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
        currentIndex: 3, // Set the index to highlight "Favourites"
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