import 'package:flutter/material.dart';

class SlideWidgets extends StatefulWidget {

  final int index;
  final List<Widget> widgets;
  final Duration duracion;

  const SlideWidgets({
    required this.index,
    required this.widgets,
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

    widgets = widget.widgets;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

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
