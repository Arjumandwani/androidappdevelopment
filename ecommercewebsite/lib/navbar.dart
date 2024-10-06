import 'package:ecommercewebsite/WomenTops.dart';
import 'package:ecommercewebsite/tops.dart';
import 'package:flutter/material.dart';

class bottomnav extends StatefulWidget {
  const bottomnav({super.key});

  @override
  State<bottomnav> createState() => _bottomnavState();
}

class _bottomnavState extends State<bottomnav> {
  int selectedIndex=1;
  List selectedwidget=[MyApplication(),
    WomenTops(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      BottomNavigationBar(
        
        unselectedItemColor:Colors.red,
        /*currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Navigate to the selected screen
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyApplication()),
            );
          } else if (index == 1) {
             MyWomenTops();
            
          }
        },*/
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
            backgroundColor:Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop,),
            label: 'Shop',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge,),
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
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        onTap:(index)
        {
          setState(() {
            selectedIndex=index;
          });
        }
      ),);
  }
}