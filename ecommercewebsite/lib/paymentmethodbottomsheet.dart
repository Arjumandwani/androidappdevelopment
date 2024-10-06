import 'package:ecommercewebsite/shippingaddresses.dart';
import 'package:flutter/material.dart';
import 'package:ecommercewebsite/sametxtStyle.dart';

class Sheets extends StatefulWidget {
  @override
  State<Sheets> createState() => _SheetsState();
}

class _SheetsState extends State<Sheets> {
  bool isPaymentSelected = true; // Initial payment setting

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Payment Methods', style: SameTextStyle.heading)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text("Your Payment Cards", style: SameTextStyle.heading),
              ),
              GestureDetector(
                onTap: () {
                  // Open BottomSheet or perform action when clicking on the card
                  _showCardDetailsBottomSheet(context, 'Card 1 Details');
                },
                child: Image.asset("assets/images/Card.png"),
              ),
              GestureDetector(
                onTap: () {
                  // Open BottomSheet or perform action when clicking on the card
                  _showCardDetailsBottomSheet(context, 'Card 2 Details');
                },
                child: Image.asset("assets/images/Card2.png"),
              ),
              SizedBox(height: 20.0), // Add some space between the images and the checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: isPaymentSelected,
                    onChanged: (value) {
                      setState(() {
                        isPaymentSelected = value!;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Use Default Payment Settings',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to show BottomSheet with card details
  void _showCardDetailsBottomSheet(BuildContext context, String cardDetails) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width:double.infinity,
          height:500,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Add a new card',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
               TextField(
              
              decoration: InputDecoration(
                hintText: 'Name on Card', // Set the hint text
                 // Optional label text
                border: OutlineInputBorder(), // Optional border decoration
              ),
               ),
              SizedBox(height: 10.0),
               TextField(
              
              decoration: InputDecoration(
                hintText: 'Card Number', // Set the hint text
                 // Optional label text
                border: OutlineInputBorder(), // Optional border decoration
              ),
               ),
               SizedBox(height:10),
                 TextField(
                               
                               decoration: InputDecoration(
                                 hintText: 'Expire Date', // Set the hint text
                 // Optional label text
                                 border: OutlineInputBorder(), // Optional border decoration
                               ),
                                ),SizedBox(height:10),
                   TextField(
              
              decoration: InputDecoration(
                hintText: 'CVV', // Set the hint text
                 // Optional label text
                border: OutlineInputBorder(), // Optional border decoration
              ),
               ),
           
              SizedBox(height: 20.0),
              Container(width:double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                     Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Address(),
                  ),);
                  },
                         style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red)),
                  child: Text('ADD CART',style:TextStyle(color:Colors.white)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}