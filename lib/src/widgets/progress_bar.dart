import 'package:flutter/material.dart';


class ProgressBar extends StatefulWidget {

  final int largo;
  final int index;
  final double ancho;

  const ProgressBar({
    required this.largo,
    required this.index,
    this.ancho = 250,
  });

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> 
  with TickerProviderStateMixin
{
  
  @override
  Widget build(BuildContext context) {

    double sizeOcupado = (widget.index*widget.ancho)/widget.largo;

    return Stack(
      children: [
        Container(
          height: 20,
          width: this.widget.ancho,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10)
          ),
        ),

        Container(
          height: 20,
          width: sizeOcupado,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ],
    );
  }
}
