import 'package:flutter/material.dart';

import 'package:after_layout/after_layout.dart';


class Animacion extends StatefulWidget {

  final Offset inicio;
  final Offset fin;
  final Widget boton;

  Animacion({
    required this.inicio, 
    required this.fin, 
    required this.boton,
  });

  @override
  _AnimacionState createState() => _AnimacionState();
}
class _AnimacionState extends State<Animacion> with AfterLayoutMixin{

  late Offset position;

  @override
  void initState() {
    super.initState();
    position = widget.inicio;
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedContainer(
      duration: Duration(seconds: 2),
      margin: EdgeInsets.only(
        top: position.dy,
        left: position.dx
      ),
      child: widget.boton,
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      position = widget.fin;
    });
  }
}