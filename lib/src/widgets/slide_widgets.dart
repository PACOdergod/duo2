import 'package:flutter/material.dart';

class SlideWidgets extends StatefulWidget {

  final int index;
  final List<Widget> widgets;
  final double ancho;
  final Duration duracion;

  const SlideWidgets({
    required this.index,
    required this.widgets,
    required this.ancho,
    this.duracion = const Duration(milliseconds: 1000),
  });

  @override
  _SlideWidgetsState createState() => _SlideWidgetsState();
}

class _SlideWidgetsState extends State<SlideWidgets> 
  with SingleTickerProviderStateMixin
{

  List<Widget> widgets = [];
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, 
      duration: widget.duracion,
    );

    widgets = [
      // Container(
      //   height: 100,
      //   width: widget.ancho,
      //   color: Colors.transparent,
      // ),
      ...widget.widgets
    ];
    // widgets.insert(0, );
  }

  bool isFirst = true;

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: como puedo hacer que el primer slide no se anime
    // isFirst 
    //   ? controller.forward(from: 1) 
    //   : controller.forward(from: 0);
    // isFirst = false;

    return Stack(
      children: [

        SlideTransition(
          position: Tween(begin: Offset(0, 0), end: Offset(-1, 0))
          .animate(CurvedAnimation(
            parent: controller, 
            curve: Curves.easeInOutSine)),
          child: widgets[widget.index],
        ),
        SlideTransition(
          position: Tween(begin: Offset(1, 0), end: Offset(0, 0))
          .animate(CurvedAnimation(
            parent: controller, 
            curve: Curves.easeInOutSine)),
          child: widgets[widget.index+1],
        )

      ],
    );
  }
}
