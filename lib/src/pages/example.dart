import 'package:duo2/src/widgets/progress_bar.dart';
import 'package:flutter/material.dart';


class ExamplePage extends StatefulWidget {

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> 
with SingleTickerProviderStateMixin
{

  int index = 0;
  int tam = 5;
  late double ancho = MediaQuery.of(context).size.width;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(index == tam) index=0;
            else index++;
          });
        },
      ),

      body: Center(
        child: ProgressBar(
          index: index,
          largo: tam,
        ),
      )
   );
  }
}