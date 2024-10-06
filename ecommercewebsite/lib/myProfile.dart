import 'package:ecommercewebsite/myorders.dart';
import 'package:ecommercewebsite/settings.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ListItem> accountItems = [
      ListItem(
        title: 'My Orders',
        icon: Icons.shopping_bag,
        subtitle:'Already have 12 orders' ,
        // Uncomment and replace with your actual screen when you are ready
        navigateTo: MyOrdersScreen(),
      ),
      ListItem(
        title: 'Shipping Addresses',
        
        icon: Icons.location_on,
        subtitle: '3 addresses',
        // Uncomment and replace with your actual screen when you are ready
        navigateTo: MyOrdersScreen(),
      ),
      ListItem(
        title: 'Payment Methods',
        icon: Icons.payment,
        // Uncomment and replace with your actual screen when you are ready
         navigateTo: MyOrdersScreen(),
         subtitle:'Visa **34'
      ),
      ListItem(
        title: 'Promo Codes',
        icon: Icons.local_offer,
        // Uncomment and replace with your actual screen when you are ready
         navigateTo: MyOrdersScreen(),
         subtitle:'You have special promoCodes'
      ),
      ListItem(
        title: 'My Reviews',
        icon: Icons.rate_review,
        // Uncomment and replace with your actual screen when you are ready
         navigateTo: MyOrdersScreen(),
         subtitle: 'Reviews for 4 items'
      ),
      ListItem(
        title: 'Settings',
        icon: Icons.settings,
        // Uncomment and replace with your actual screen when you are ready
         navigateTo: SettingsScreen(),
         subtitle:'Notifications, password'
      ),
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:30.0),
              child: Text(
                "My Profile",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/ava.png'), // Replace with your actual profile image URL
              ),
            ),
            
            Row(
              children: [
                Text(
                  "Matilda Brown",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              "matildaBrown@mail.com",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 32),
            
           
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: accountItems.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Icon(accountItems[index].icon),
                        title: Text(accountItems[index].title),
                        subtitle:Text(accountItems[index].subtitle),
                        onTap: () {
                          // Uncomment and replace with your actual screen when you are ready
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => accountItems[index].navigateTo),
                          );
                        },
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem {
  final String title;
  final IconData icon;
  final String subtitle;
  // Uncomment and replace with your actual screen when you are ready
 final Widget navigateTo;

  ListItem({
    required this.title,
    required this.icon,
    required this.navigateTo,
     required this.subtitle, 
  });
}