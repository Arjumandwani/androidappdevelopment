import 'package:ecommercewebsite/settings.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  final List<Order> orders = [
    Order(orderNumber: '12345', orderDate: DateTime.now(), totalAmount: 85.0, status: OrderStatus.Delivered),
    Order(orderNumber: '67890', orderDate: DateTime.now(), totalAmount: 120.0, status: OrderStatus.Processing),
    Order(orderNumber: '54321', orderDate: DateTime.now(), totalAmount: 50.0, status: OrderStatus.Cancelled),
    // Add more orders as needed
  ];

  int _currentIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button press for Delivered
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                child: Text('Delivered', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button press for Processing
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                child: Text('Processing', style: TextStyle(color: Colors.white)),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle button press for Cancelled
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black)),
                child: Text('Cancelled', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to order details screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailsPage(order: orders[index]),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 3.0,
                    margin: EdgeInsets.all(8.0),
                    color: Colors.white, // Set background color to white
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order #${orders[index].orderNumber}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8.0),
                          Text('Order Date: ${orders[index].orderDate.toString()}', style: TextStyle(fontSize: 14)),
                          SizedBox(height: 8.0),
                          Text('Total Amount: \$${orders[index].totalAmount.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
                          SizedBox(height: 8.0),
                          Text('Tracking Number: ${orders[index].trackingNumber}', style: TextStyle(fontSize: 14,)),
                          SizedBox(height: 8.0),
                          Text('Quantity: ${orders[index].quantity}', style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
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
      ),
    );
  }
}

class OrderDetailsPage extends StatefulWidget {
  final Order order;

  OrderDetailsPage({required this.order});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Number: ${widget.order.orderNumber}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Order Date: ${widget.order.orderDate.toString()}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text('Total Amount: \$${widget.order.totalAmount.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height:500),
              ElevatedButton(
              onPressed: () {
                // Navigate to Settings screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
              child: Text('Go to Settings'),
            ),
          
          ],
        ),
      ),
    );
  }
}

class Order {
  final String orderNumber;
  final DateTime orderDate;
  final double totalAmount;
  final String trackingNumber;
  final int quantity;
  OrderStatus status;

  Order({
    required this.orderNumber,
    required this.orderDate,
    required this.totalAmount,
    required this.status,
    this.trackingNumber = 'ABC123',
    this.quantity = 3,
  });
}

enum OrderStatus {
  Delivered,
  Processing,
  Cancelled,
}

void main() {
  runApp(MaterialApp(
    home: MyOrdersScreen(),
  ));
}