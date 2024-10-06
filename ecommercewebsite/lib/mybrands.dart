import 'package:ecommercewebsite/Blackdress.dart';
import 'package:ecommercewebsite/myrangeslider.dart';
import 'package:ecommercewebsite/womentopsapi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyBrands());
}

class MyBrands extends StatefulWidget {
  @override
  State<MyBrands> createState() => _MyAppState();
}

class _MyAppState extends State<MyBrands> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ItemListScreen(),
    );
  }
}

class ItemListScreen extends StatefulWidget {
  @override
  _ItemListScreenState createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final List<Item> items =[
    Item('adidas'),
    Item('adidas Originals'),
    Item('Blend'),
    Item('Boutique Moschino'),
    Item('Champion'),
    Item('Diesel'),
    Item('Jack and Jones'),
    Item('Naf Naf'),
    Item('Red Valentino'),
    Item('s.Oliver'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Brand'),
          ],
        ),
         
         actions: [
        IconButton(
          icon: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.search),
          ),
          onPressed: () {
            // Handle the search button tap
            // You can add your search logic here
          },
        ),
      ],
      ),
      body: Container(height:double.infinity,
      
      
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index].name),
                leading: Checkbox(
                  value: items[index].isChecked,
                  onChanged: (value) {
                    setState(() {
                      items[index].isChecked = value!;
                      if (value) {
                        // If item is ticked, show bottom sheet
                        _showBottomSheet(items[index]);
                      }
                    });
                  },
                  activeColor: Colors.red,
                    shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, // Set borderRadius to BorderRadius.zero
                ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(Item item) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
         return FractionallySizedBox(
        widthFactor: 1.0,
        child: Container(
         /*width: double.infinity,*/
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              
              SizedBox(height: 16),
              
              
              Row(mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Container(width:140,
                  height:30,

                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Discard',style:TextStyle(color:Colors.black)),
                      
                    ),
                  ),
                SizedBox(width:80),
              
              Container(width:140,
                  height:30,
                child: ElevatedButton(
                  onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Blackdress()),
                );
                  
                
                  },
                
                   style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red),
                   ),
                   
                  child: Text('Apply',style:TextStyle(color:Colors.white)),
                ),
              ),
              
            ],
            
          ),
            ]
          
          ),
           )  );
      },
    );
  }
}

class Item {
  final String name;
  bool isChecked;

  Item(this.name, {this.isChecked = false});
}