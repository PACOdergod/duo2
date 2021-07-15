import 'package:flutter/material.dart';

import 'progress_bar.dart';


class ProgressPage extends StatefulWidget {

  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> 
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