import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/provider/anotherprovider.dart';
class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}


class _ExampleOneScreenState extends State<ExampleOneScreen> {
  double value=1.0;
  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ExampleOneProvider>(context,listen:false);
    print('build');
    return Scaffold(
      appBar:AppBar(
        title:const Text('Subscribe'),
      ),
      body:Column(mainAxisAlignment:MainAxisAlignment.center,
      children:[
        Consumer<ExampleOneProvider>(builder: (context,value,child){
          return Slider(
            min:0,
            max:1,value:value.value,onChanged:(val){
              
            value.SetValue(val);
            
         } );
        }
        ),
      
      
      
          

  Consumer<ExampleOneProvider>(builder: (context,value,child)
  {return Row(children: [Expanded(
              child: Container(
                height:100,
                decoration:BoxDecoration(color:Colors.green.withOpacity(value.value)),child:Center(child:Text('Container 1'),)),
            ),
            Expanded(
              child: Container(
                height:100,
                decoration:BoxDecoration(color:Colors.red.withOpacity(value.value)),child:Center(child:Text('Container 1'),)),
            )]);
  }
          
         ),
      ],
      ),

    );
  
  }
      
     

  }
