import 'package:ecommercewebsite/paymentmethodbottomsheet.dart';
import 'package:ecommercewebsite/sametxtStyle.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  bool isPaymentSelected = true; // Initial payment setting

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Payment Methods', style: SameTextStyle.heading)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Your payment cards", style: SameTextStyle.heading),
                ),
                Image.asset("assets/images/Card.png"),
                Image.asset("assets/images/Card2.png"),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    // Navigate to the next screen when "Use Default Payment Settings" is tapped
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Sheets()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
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
                  ),
                ),
                
            ElevatedButton(
                  onPressed: () {
                    // Navigate to the Sheets screen when the button is pressed
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Sheets()));
                  },
                  child: Text('Navigate to Sheets'),
                ),   ],
              
            ),
            
          ),
        ),
      ),
    );
  }
}