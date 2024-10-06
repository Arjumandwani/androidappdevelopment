import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:ecommercewebsite/success.dart';
import 'package:flutter/material.dart';

class AddressDetailsScreen extends StatelessWidget {
  final String selectedName;
  final String selectedAddress;

  AddressDetailsScreen({required this.selectedName, required this.selectedAddress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address Details'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Adding Shipping Details",style:SameTextStyle.heading),
              SizedBox(height:20),
              TextFormField(
                initialValue: selectedName,
                decoration: InputDecoration(labelText: 'Name',  border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white), 
                // Set border color here
              ),),
                readOnly: true,
                
              ),
              SizedBox(height: 50.0),
              TextFormField(
                initialValue: selectedAddress,
                decoration: InputDecoration(labelText: 'Address',border:OutlineInputBorder(borderSide: BorderSide(color:Colors.white))),
                readOnly: true,
              ),
              SizedBox(height: 50.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'City',border:OutlineInputBorder(borderSide:BorderSide(color: Colors.white) )),
                // Add any necessary controller or logic based on your requirements
              ),
              SizedBox(height: 50.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Zip Code',border:OutlineInputBorder(borderSide:BorderSide(color: Colors.white))),
                
              ),
                SizedBox(height: 50.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Country',border:OutlineInputBorder(borderSide:BorderSide(color: Colors.white))),
                
              ),
              SizedBox(height: 50.0),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => success(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  ),
                  child: Text("SAVE ADDRESS", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}