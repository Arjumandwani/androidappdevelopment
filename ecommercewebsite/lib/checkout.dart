import 'package:ecommercewebsite/paymentmethodbottomsheet.dart';
import 'package:ecommercewebsite/paymentmethods.dart';
import 'package:flutter/material.dart';
import 'package:ecommercewebsite/bagscreen.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double subtotal = BagScreen.bagItems.fold(0, (sum, item) => sum + (item.price ?? 0));

    // You can add more details like address, payment methods, etc.

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Checkout')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping address'),
                    TextButton(
                      onPressed: () {
                        // Implement navigation to a screen for updating the address
                        // Navigator.push(...);
                      },
                      child: Text('Change', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
                Text("Jane Doe"),
                Text("3 Newbridge Court"),
                Text("Chino Hills, 91709, United States"),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('payment methods'),
                    TextButton(
                      onPressed: () {
                         Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Payment(),) 
                         );
                      },
                      child: Text('Change', style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
          SizedBox(height: 300,),
          Container(
            child: Column(
              children: [
                ListTile(title: Text("Order"), trailing: Text('112\$')),
                ListTile(title: Text("Delivery"), trailing: Text("15\$")),
                ListTile(title: Text("Summary"), trailing: Text("127\$")),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Sheets(),
      ),
    );
                },
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                child: Text('SUBMIT ORDER', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
  