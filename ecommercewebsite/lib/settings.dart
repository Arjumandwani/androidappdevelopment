import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool emailNotifications = true;
  bool pushNotifications = true;
  bool popNotifications = true;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Full Name'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Date of Birth'),
            ),
            SizedBox(height: 16),
             TextField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Show bottom sheet for changing password
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ChangePasswordBottomSheet();
                  },
                );
              },
              child: Text(
                'Change Password',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            buildNotificationToggle(
              'Sales',
              emailNotifications,
              (value) {
                setState(() {
                  emailNotifications = value;
                });
              },
            ),
            buildNotificationToggle(
              'New arrivals',
              pushNotifications,
              (value) {
                setState(() {
                  pushNotifications = value;
                });
              },
            ),
            buildNotificationToggle(
              'Delivery status changes',
              popNotifications,
              (value) {
                setState(() {
                  popNotifications = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationToggle(
    String title,
    bool value,
    Function(bool) onChanged,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Switch(
          value: value,
          onChanged: onChanged,
           activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
        inactiveTrackColor: Colors.grey,
        inactiveThumbColor: Colors.grey,
        ),
      ],
    );
  }
}

class ChangePasswordBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              ' Password  Change',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 16),
          Card(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Old Password'),
            ),
          ),
          SizedBox(height: 16),
          Card(
            child: TextField(
              obscureText: true,
              controller: TextEditingController(),
              decoration: InputDecoration(labelText: 'New Password'),
            ),
          ),
          SizedBox(height: 16),
          Card(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: 'Repeat New Password'),
            ),
          ),
          SizedBox(height: 16),
          Container(width:double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Implement logic to change the password
                Navigator.pop(context); // Close the bottom sheet after changing the password
              }, style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
              child: Text('Change Password',style:TextStyle(color:Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}