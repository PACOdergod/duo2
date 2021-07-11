import 'package:flutter/material.dart';

class ModuleUtils {


  static Color colorLevel(int? level){

    final List<Color> colorsLevels = [
      Colors.purple[200]!,
      Colors.lightBlue[400]!,
      Colors.green
    ];

    if(level==null) return colorsLevels[0];
    if(level==colorsLevels.length) return colorsLevels.last; 
    if(level>colorsLevels.length) return colorsLevels.last;
    else return colorsLevels[0];
  }
}