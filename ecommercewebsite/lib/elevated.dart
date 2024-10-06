import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('List Example'),
        ),
        body: MyList(),
      ),
    );
  }
}

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final List<String> items = List.generate(11, (index) => 'Item $index');
  bool isListVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              isListVisible = !isListVisible;
            });
          },
          child: Text('Toggle List'),
        ),
        if (isListVisible)
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 30,
                      color: Colors.blue, // Customize the color as needed
                      child: Center(
                        child: Text(
                          'Header $index',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      child: ListTile(
                        title: Text(items[index]),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
      ],
    );
  }
}
