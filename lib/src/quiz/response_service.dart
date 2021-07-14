import 'package:duo2/src/quiz/quiz_botones.dart';

import 'package:flutter/material.dart';



class ResponseService with ChangeNotifier {

  final Map<String, bool> opciones;

  ResponseService(this.opciones){
    int i = 0;
    opciones.forEach((key, value) {
      var boton = Opcion(text: key, mostrar: value, index: i,);
      misOpciones.add(boton);
      i++;
    });
  }

  List<Respuesta> misRespuestas = [];
  List<Option> misOpciones = [];

  late GlobalKey keyColumna;


  void quitarRespuesta( int index, Size tam ){
    misOpciones[index] = Sombra(tam: tam, index: index);
    notifyListeners();
  }


  void addRespuesta(String res){

    misOpciones.forEach((opcion) {
      if (opcion.text == res) opcion.mostrar = false;
    });

    var boton = Respuesta(text: res);
    misRespuestas.add(boton);


    notifyListeners();
  }

  seleccionoOpcion( Offset positionI, Offset positionF, Container widget ){

    animacion = Container(
      child: widget,
      color: Colors.black,
      margin: EdgeInsets.only(
        top: positionI.dy,
        left: positionI.dx
      ),
    );

    notifyListeners();
  }


  Widget animacion = Container();

}
