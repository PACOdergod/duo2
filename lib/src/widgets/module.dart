import 'package:flutter/material.dart';

import 'package:duo2/src/widgets/radia_progress.dart';

//TODO: cambiar el color de fondo conforme al nivel

class Module extends StatelessWidget {

  final double radio;
  final double? porcentaje;
  final int? level;
  final IconData? icon;

  Module({
    this.radio = 120,
    this.porcentaje = 0,
    this.icon, 
    this.level = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radio,
      width: radio,
      margin: EdgeInsets.all(5),
      child: Stack(
        children: [
          RadialProgress(
            procentaje: this.porcentaje, 
            colorPrimario: Colors.orange
          ),

          _iconoModule(this.level),

          Positioned(
            bottom: 0,
            right: 0,
            child: _levelModule(this.level)
          )
        ],
      ),
    );
  }

  final List<Color> colorsLevels = [
    Colors.purple[200]!,
    Colors.lightBlue[400]!,
    Colors.green
  ];

  Container _iconoModule(int? level) {

    if(level==null) level = colorsLevels.length-1; 
    if(level==colorsLevels.length) level = colorsLevels.length-1; 
    if(level>colorsLevels.length) level = colorsLevels.length-1; 

    return Container(
      height: radio*.8,
      width: radio*.8,
      margin: EdgeInsets.all(radio*.1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radio),
        color: colorsLevels[level],
      ),
      child: Icon(icon, size: radio*.65,),
    );
  }

  Container _levelModule(int? level) {
    return Container(
      height: radio*.30,
      width: radio*.30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radio),
        color: Colors.white,
      ),
      child: Center(

        child: Container(
          height: radio*.25,
          width: radio*.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radio),
            color: level==null||level==0 ? Colors.black12 : Colors.amber,
          ),

          child: Center(
            child: Text( level==null||level==0 ? "" : "$level",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: radio*.15,
                color: Colors.amber[800]
              ),
            ),
          ),
        ),
      ),
    );
  }
}