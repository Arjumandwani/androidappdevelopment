import 'package:ecommercewebsite/addshippingaddress.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Address());
}

class Address extends StatefulWidget {
  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Shipping Addresses')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AddressCard(
                name: 'John Doe',
                address: '3 Newbridge Court',
              ),
              SizedBox(height: 16.0),
              AddressCard(
                name: 'Jane Doe',
                address: '456 Oak St, Townsville',
              ),
              SizedBox(height: 16.0),
              AddressCard(
                name: 'Jim Smith',
                address: '789 Pine St, Villageland',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressCard extends StatefulWidget {
  final String name;
  final String address;

  AddressCard({required this.name, required this.address});

  @override
  _AddressCardState createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name: ${widget.name}',
                  style: TextStyle(fontSize: 16.0),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressDetailsScreen(
                          selectedName: widget.name,
                          selectedAddress: widget.address,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Address: ${widget.address}',
                  style: TextStyle(fontSize: 16.0),
                ),
                Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                      if (isChecked) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressDetailsScreen(
                              selectedName: widget.name,
                              selectedAddress: widget.address,
                            ),
                          ),
                        );
                      }
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}