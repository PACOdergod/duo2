
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:flutter/material.dart';

class ResponseService with ChangeNotifier {

  final Map<String, bool> opciones;
  List<GestureDetector> respuestas = [];
  final List<String> respsUser = [];

  ResponseService(this.opciones);


}