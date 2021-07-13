
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:flutter/material.dart';

class ResponseService with ChangeNotifier {

  var _animacion = Container();
  Widget get animacion=> _animacion;

  animar(Offset offset, Size size){
    _animacion = Container(
      margin: EdgeInsets.only(
        top: offset.dy,
        left: offset.dx
      ),
      height: size.height,
      width: size.width,
      color: Colors.red,
    );

    notifyListeners();
  }

}