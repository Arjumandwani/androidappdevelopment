import 'package:flutter/material.dart';
class StateFulWidget extends StatefulWidget {
  const StateFulWidget({super.key});

  @override
  _StateFulWidgetState createState() => _StateFulWidgetState();
}
int count=0;

class _StateFulWidgetState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar:AppBar(title:Text('Subscribe')),body:Column(mainAxisAlignment:MainAxisAlignment.center,crossAxisAlignment:CrossAxisAlignment.center, children:[Container(child:Center(child:Text(count.toString(),style:TextStyle(fontSize:50),)))],),
    floatingActionButton: FloatingActionButton(onPressed: (){
      count++;
      print(count++);
      setState(() {
        
      });
    },
    child:Icon(Icons.add),));
  }
}