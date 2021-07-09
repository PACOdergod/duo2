import 'package:flutter/material.dart';


class ProgressBar extends StatelessWidget {

  final int largo;
  final int index;
  final double ancho;

  const ProgressBar({
    required this.largo,
    required this.index,
    this.ancho = 250,
  });


  @override
  Widget build(BuildContext context) {

    double sizeOcupado = (index*ancho)/largo;

    return Stack(
      children: [
        Container(
          height: 20,
          width: this.ancho,
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
