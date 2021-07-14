import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

class Animacion extends StatefulWidget {

  final Offset inicio;
  final Offset fin;

  const Animacion({
    Key? key, 
    required this.inicio, 
    required this.fin,

  }) : super(key: key);

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
      child: Demo(),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      position = widget.fin;
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