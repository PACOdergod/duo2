import 'package:duo2/src/quiz/quiz_botones.dart';

import 'package:flutter/material.dart';



class ResponseService with ChangeNotifier {

  final Map<String, bool> opciones;
  List<Opcion> totalOpciones = [];

  ResponseService(this.opciones){
    int i = 0;
    opciones.forEach((key, value) {
      var boton = Opcion(text: key, index: i,);
      misOpciones.add(boton);
      totalOpciones.add(boton);
      i++;
    });
  }


  List<Respuesta> misRespuestas = [];
  List<Option> misOpciones = [];

  late GlobalKey keyColumna;


  void addRespuesta(String res, int index, Size tam){
    misRespuestas.add(Respuesta(text: res, index: index,));
    misOpciones[index] = Sombra(tam: tam, index: index);
    notifyListeners();
  }

  void quitarRespuesta(int index, String text){
    //TODO: deben ser 2 funciones para que se mande a llamar 
    // agregar opcion despues de terminar la animacion
    misRespuestas.removeWhere((element) => element.text == text);
    misOpciones[index] = Opcion(text: text, index: index);

    notifyListeners();
  }

  seleccionoOpcion( Offset positionI, Container widget ){
    // obtener el offset de la columna
    final boxC = keyColumna.currentContext!.findRenderObject()
      as RenderBox;
    final offsetC = boxC.localToGlobal(Offset.zero);

    animacion = Container(
      child: widget,
      margin: EdgeInsets.only(
        top: positionI.dy - offsetC.dy,
        left: positionI.dx - offsetC.dx
      ),
    );

    notifyListeners();
  }

  addPosicionFinal( Offset positionI, Container widget ){
    final boxC = keyColumna.currentContext!.findRenderObject()
      as RenderBox;
    final offsetC = boxC.localToGlobal(Offset.zero);

    animacionf = Container(
      child: widget,
      margin: EdgeInsets.only(
        top: positionI.dy - offsetC.dy,
        left: positionI.dx - offsetC.dx
      ),
    );

    notifyListeners();
  }


  Widget animacion = Container();
  Widget animacionf = Container();

}
