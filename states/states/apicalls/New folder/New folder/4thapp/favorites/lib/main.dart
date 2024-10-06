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
          title: Text('App Grid View'),
        ),
        body: AppGridView(),
      ),
    );
  }
}

class App extends StatefulWidget {
  final String imageLink;
  final String title;

  const App({required this.imageLink, required this.title});

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              widget.imageLink,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
              Text(widget.title),
            ],
          ),
        ],
      ),
    );
  }
}

class AppGridView extends StatelessWidget {
  final List<String> appImages = [
    'link_to_image1',
    'link_to_image2',
    'link_to_image3',
  ];

  final List<String> appTitles = ['App 1 Title', 'App 2 Title', 'App 3 Title'];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: appImages.length,
      itemBuilder: (context, index) {
        return App(
          imageLink: appImages[index],
          title: appTitles[index],
        );
      },
    );
  }
}