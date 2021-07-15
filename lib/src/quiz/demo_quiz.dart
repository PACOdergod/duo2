import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import 'animacion.dart';



class DemoQuiz extends StatefulWidget {
  @override
  _DemoQuizState createState() => _DemoQuizState();
}

class _DemoQuizState extends State<DemoQuiz> {

  bool animar = false;

  Offset inicial = Offset(200, 500);
  Offset fin = Offset(100, 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          animar ? new Animacion(
            inicio: inicial,
            fin: fin,
            boton: Container(),
          ) 
          : Container(),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            animar = true;
          });
        },
      ),
   );
  }
}