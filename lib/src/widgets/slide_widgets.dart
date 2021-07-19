import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/quiz/quiz_section.dart';
import 'package:flutter/material.dart';

class SlideWidgets extends StatefulWidget {

  final int index;
  final List<Quiz> quizes;
  final double ancho;
  final Duration duracion;

  const SlideWidgets({
    required this.index,
    required this.quizes,
    required this.ancho,
    this.duracion = const Duration(milliseconds: 1000),
  });

  @override
  _SlideWidgetsState createState() => _SlideWidgetsState();
}

class _SlideWidgetsState extends State<SlideWidgets> 
  with SingleTickerProviderStateMixin
{

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, 
      duration: widget.duracion,
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  bool primero = true;
  List<Widget> widgets = [];

  @override
  Widget build(BuildContext context) {
    if (primero) {
      controller.forward(from: 1);
      primero = false;
    }
    else{
      controller.forward(from: 0);
    }

    return Stack(
      children: [

        SlideTransition(
          position: Tween(begin: Offset(0, 0), end: Offset(-1, 0))
          .animate(CurvedAnimation(
            parent: controller, 
            curve: Curves.easeInOutSine)),
            // TODO no debe crear una nueva instancia de quiz section
            // ya que esta ya existe
          // child: new QuizSection(currentQuiz: widget.quizes[widget.index]),
        ),

        SlideTransition(
          position: Tween(begin: Offset(1, 0), end: Offset(0, 0))
          .animate(CurvedAnimation(
            parent: controller, 
            curve: Curves.easeInOutSine)),
          // child: new QuizSection(currentQuiz: widget.quizes[widget.index]),
        )

      ],
    );
  }
}
