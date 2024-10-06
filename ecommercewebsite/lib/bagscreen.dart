import 'package:ecommercewebsite/checkout.dart';
import 'package:flutter/material.dart';
import 'package:ecommercewebsite/modules/PostModel.dart';

class BagScreen extends StatefulWidget {
  static List<PostModel> bagItems = [];
  PostModel? selectedProduct; // Selected product from NewWomen tops

  BagScreen({this.selectedProduct});

  @override
  State<BagScreen> createState() => _BagScreenState();

  static void addItemToBag(PostModel item) {
    bagItems.add(item);
  }
}

class _BagScreenState extends State<BagScreen> {
  int selectedProductQuantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Bag'),
      ),
      body: Column(
        children: [
          if (widget.selectedProduct != null)
            ListTile(
              title: Text(widget.selectedProduct!.title ?? 'No Title'),
              subtitle: Text(widget.selectedProduct!.category ?? 'No Category'),
              leading: Image.network(
                widget.selectedProduct!.image ?? '',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (selectedProductQuantity > 1) {
                        setState(() {
                          selectedProductQuantity--;
                        });
                      }
                    },
                  ),
                  Text('$selectedProductQuantity'),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        selectedProductQuantity++;
                      });
                    },
                  ),
                ],
              ),
            ),
          for (var item in BagScreen.bagItems)
            ListTile(
              title: Text(item.title ?? 'No Title'),
              subtitle: Text(item.category ?? 'No Category'),
              leading: Image.network(
                item.image ?? '',
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ListTile(
            title: Text('Total Items: ${BagScreen.bagItems.length + selectedProductQuantity}'),
          ),
          if (BagScreen.bagItems.isNotEmpty || widget.selectedProduct != null)
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: BagScreen.bagItems.length + (widget.selectedProduct != null ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == 0 && widget.selectedProduct != null) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        widget.selectedProduct!.image ?? '',
                        height: 200,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    );
                  } else {
                    var item = BagScreen.bagItems[index - (widget.selectedProduct != null ? 1 : 0)];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        item.image ?? '',
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                    );
                  }
                },
              ),
            ),
          SizedBox(height: 100),
          Container(width:double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutScreen()),
                );
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text('Checkout', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}