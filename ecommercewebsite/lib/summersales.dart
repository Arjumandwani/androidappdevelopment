

import 'package:ecommercewebsite/tops.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion Store'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Men'),
            Tab(text: 'Women'),
            Tab(text: 'Kids'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Content for Men
          Center(child: Text('Content for Men')),

          // Content for Women
          WomenSection(),

          // Content for Kids
          Center(child: Text('Content for Kids')),
        ],
      ),
    );
  }
}

class WomenSection extends StatelessWidget {
  final List<String> titles = ['Clothes', 'Item 2', 'Acessories']; // Replace with your actual data
  final List<String> assetPaths = [
    'assets/images/jeans.jpg',
    'assets/images/clothess.png',
    'assets/images/necklace.png',
   
  ]; // Replace with your actual asset paths

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 100,
              decoration: BoxDecoration(
            color: Colors.red, // Customize the color as needed
            borderRadius: BorderRadius.circular(30.0),
            ),// Customize the color as needed
            child: Center(
              child: Text(
                'SUMMER SALES ',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height:100),
          Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100, // Set the desired height for each tile
                child: ListTile(
                  title: Text(titles[index]),
                  trailing: Image.asset(
                    assetPaths[index],
                    width: 50,
                    height: 190,
                    fit: BoxFit.cover,
                  ),
                ),
              );
             
            },
       
             
          ),
          ) ,ElevatedButton(onPressed:()
                                 {Navigator.push(context,MaterialPageRoute(builder:(context)=> MyApplication()));
                       
                                 },
                                 style:ButtonStyle(backgroundColor:MaterialStateProperty.all <Color>(Colors.red)),
                                 child:Text('LOGIN',style: TextStyle(color: Colors.white),),
                       
                                 ),]));
          
      
  }
}