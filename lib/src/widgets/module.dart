import 'package:flutter/material.dart';

import 'package:duo2/src/utils/module_utils.dart';
import 'package:duo2/src/widgets/radia_progress.dart';

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

  Container _iconoModule(int? level) { 

    var color = ModuleUtils.colorLevel(level);

    return Container(
      height: radio*.8,
      width: radio*.8,
      margin: EdgeInsets.all(radio*.1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radio),
        color: color,
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