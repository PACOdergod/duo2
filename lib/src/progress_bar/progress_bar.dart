import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {

  final int largo;
  final int index;
  final double ancho;
  final Color color;

  const ProgressBar({
    required this.largo,
    required this.index,
    this.ancho = 250,
    this.color = Colors.green,
  });

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> 
  with SingleTickerProviderStateMixin
{

  late int index;
  late int indexAnterior;
  late AnimationController controller;
  var moveAnimation;

  @override
  void initState() {
    super.initState();
    indexAnterior = 0;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000)
    );

    moveAnimation = new Tween(
      begin: 0,
      end: 1.0,
    ).animate(new CurvedAnimation(
      parent: controller,
      curve: Curves.elasticOut
    ));
  }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.index - indexAnterior;
    double factorUnidad = widget.ancho/widget.largo;

    indexAnterior = widget.index;

    return Stack(
      children: [

        Container(
          height: 20,
          width: this.widget.ancho,
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
        
        AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) { 
            return Container(
              height: 20,                
              width: (widget.index - diferenciaAnimar)*factorUnidad 
              + (diferenciaAnimar*moveAnimation.value)*factorUnidad,

              margin: EdgeInsets.only(left: 20),

              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(10)
              ),
            );
          },
        ),

        AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Container(
              margin: EdgeInsets.only(
                left: (widget.index - diferenciaAnimar)*factorUnidad 
                + (diferenciaAnimar*moveAnimation.value)*factorUnidad
                
              ),
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10)
              ),
            );
          }, 
        
        )
        
      ],
    );
    
  }
}
