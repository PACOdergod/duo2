
import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import 'animacion.dart';
import 'package:duo2/src/quiz/quiz_botones.dart';


class ResponseService with ChangeNotifier {

  final List<String> options;

  List<EjemploBoton> totalOpciones = [];

  ResponseService(this.options){
    int i = 0;
    options.forEach((opcion) {
      totalOpciones.add(EjemploBoton(text: opcion));
      var boton = Opcion(index: i);
      misOpciones.add(boton);
      i++;
    });
  }

  List<Respuesta> misRespuestas = [];
  List<Option> misOpciones = [];

  late GlobalKey keyColumna;

  void addRespuesta(int index, Size tam){
    misRespuestas.add(Respuesta( index: index ));
    misOpciones[index] = Sombra(tam: tam, index: index);
    notifyListeners();
  }

  void quitarRespuesta(int index){
    misRespuestas.removeWhere((element) => element.index == index);
    misOpciones[index] = Opcion(index: index);
    notifyListeners();
  }


  seleccionoOpcion( Offset positionI, int index ){
    // obtener el offset de la columna
    final boxC = keyColumna.currentContext!.findRenderObject() as RenderBox;
    final offsetC = boxC.localToGlobal(Offset.zero);

    posicionInicial = positionI - offsetC;
    indexBotonAnimar = index;
  }

  late Offset posicionInicial;
  late Offset posicionFinal;
  late bool empezar;
  late int indexBotonAnimar;

  addPosicionFinal( Offset position ){
    final boxC = keyColumna.currentContext!.findRenderObject()
      as RenderBox;
    final offsetC = boxC.localToGlobal(Offset.zero);

    posicionFinal = position - offsetC;
    if(empezar) iniciarAnimacion();

    // print("Inicial" + posicionInicial.toString());
    // print("Final" + posicionFinal.toString());

    empezar = false;
  }

  iniciarAnimacion() async {
    animacionf = new Animacion(
      inicio: posicionInicial, 
      fin: posicionFinal,
      boton: totalOpciones[indexBotonAnimar],
    );

    notifyListeners();

    await Future.delayed(Duration(seconds: 2));
    animacionf = new Container();
    notifyListeners();
  }

  Widget animacionf = Container();

}


