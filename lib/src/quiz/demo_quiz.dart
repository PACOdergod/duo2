import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';



class DemoQuiz extends StatelessWidget {

  Offset inicial = Offset(200, 500);
  Offset fin = Offset(100, 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Animacion(),
        ],
      )
   );
  }
}

class Animacion extends StatefulWidget {
  @override
  _AnimacionState createState() => _AnimacionState();
}

class _AnimacionState extends State<Animacion> with AfterLayoutMixin{

  Offset inicial = Offset(200, 500);
  Offset fin = Offset(100, 200);


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      margin: EdgeInsets.only(
        top: inicial.dy,
        left: inicial.dx
      ),
      child: Demo(),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      inicial = fin;
    });
  }
}

class Demo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("hola"),
      color: Colors.red,
      padding: EdgeInsets.all(10),
    );
  }
}