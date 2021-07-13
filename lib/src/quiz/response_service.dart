
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:flutter/material.dart';

class ResponseService with ChangeNotifier {

  var _animacion = Container();
  Widget get animacion=> _animacion;
  animar(){
    _animacion = Container(
      height: 100,
      width: 100,
      color: Colors.red,
    );

    notifyListeners();
  }

}