
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import 'animacion.dart';
import 'package:duo2/src/quiz/quiz_botones.dart';


class ResponseService with ChangeNotifier {

  final Map<String, bool> opciones;

  List<EjemploBoton> totalOpciones = [];

  ResponseService(this.opciones){
    int i = 0;
    opciones.forEach((key, value) {
      totalOpciones.add(EjemploBoton(text: key));
      var boton = Opcion(index: i, boton: totalOpciones[i],);
      misOpciones.add(boton);
      i++;
    });
  }

  List<Respuesta> misRespuestas = [];
  List<Option> misOpciones = [];

  late GlobalKey keyColumna;

  void addRespuesta(int index, Size tam){
    misRespuestas.add(Respuesta(text: "hola", index: index,));
    misOpciones[index] = Sombra(tam: tam, index: index);
    notifyListeners();
  }

  void quitarRespuesta(int index, String text){
    misRespuestas.removeWhere((element) => element.text == text);
    misOpciones[index] = Opcion(index: index, boton: totalOpciones[index],);

    notifyListeners();
  }


  seleccionoOpcion( Offset positionI, Widget widget ){
    // obtener el offset de la columna
    final boxC = keyColumna.currentContext!.findRenderObject()
      as RenderBox;
    final offsetC = boxC.localToGlobal(Offset.zero);

    posicionInicial = positionI - offsetC;
  }

  late Offset posicionInicial;
  late Offset posicionFinal;
  late bool empezar;

  addPosicionFinal( Offset positionI ){
    final boxC = keyColumna.currentContext!.findRenderObject()
      as RenderBox;
    final offsetC = boxC.localToGlobal(Offset.zero);

    posicionFinal = positionI - offsetC;
    if(empezar) iniciarAnimacion();

    empezar = false;
  }

  iniciarAnimacion() async {
    animacionf = new Animacion(
      inicio: posicionInicial, 
      fin: posicionFinal
    );

    notifyListeners();

    await Future.delayed(Duration(seconds: 2));
    animacionf = new Container();
    notifyListeners();
  }

  Widget animacionf = Container();

}


