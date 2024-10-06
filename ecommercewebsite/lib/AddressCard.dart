/*import 'package:flutter/material.dart';
import 'addshippingaddress.dart'; // Import the AddressSelection screen

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
    return GestureDetector(
      onTap: () {
        // Navigate to AddressSelection when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddressDetailsScreen(selectedName: '', selectedAddress: '',),
          ),
        );
      },
      child: Card(
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
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
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
                  TextButton(
                    onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddressDetailsScreen(selectedName: '', selectedAddress: ''),
                        ),
                      );
                     
                    },
                    child: Text('Edit'),
                  ),
                   ElevatedButton(
                  onPressed: () {
                    // Navigate to AddressSelection when the button is pressed
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddressDetailsScreen(selectedName: '', selectedAddress: '',),
                      ),
                    );
                  },
                  child: Text('Select Address'),
                ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/