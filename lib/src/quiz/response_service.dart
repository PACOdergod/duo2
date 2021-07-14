
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:flutter/material.dart';

class ResponseService with ChangeNotifier {

  final Map<String, bool> opciones;
  final List<String> respsUser = [];

  ResponseService(this.opciones){

    for (var i = 0; i < respsUser.length; i++) {
      var boton = Opcion(text: respsUser[i]);
      misRespuestas.add(boton);
    }

    opciones.forEach((key, value) {
      var boton = Opcion(text: key, mostrar: value);
      misOpciones.add(boton);
    });

  }

  List<Opcion> misRespuestas = [];
  List<Opcion> misOpciones = [];


  void addRespuesta(String res){
    var boton = Opcion(text: res);
    misRespuestas.add(boton);

    misOpciones.forEach((opcion) {
      if (opcion.text == res) opcion.mostrar = false;
    });

    notifyListeners();
  }
    
}

class Opcion extends StatelessWidget {

  final String text;
  Opcion({
    Key? key, 
    required this.text,
    this.mostrar = true
  });

  bool mostrar;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
      color: Colors.blue,
      padding: EdgeInsets.all(10),
    );
  }
}