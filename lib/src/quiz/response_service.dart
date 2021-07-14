
import 'package:flutter/material.dart';

class ResponseService with ChangeNotifier {

  final Map<String, bool> opciones;

  ResponseService(this.opciones){

    opciones.forEach((key, value) {
      var boton = Opcion(text: key, mostrar: value);
      misOpciones.add(boton);
    });

  }

  List<Respuesta> misRespuestas = [];
  List<Opcion> misOpciones = [];


  void addRespuesta(String res){

    misOpciones.forEach((opcion) {
      if (opcion.text == res) opcion.mostrar = false;
    });

    var boton = Respuesta(text: res);
    misRespuestas.add(boton);


    notifyListeners();
  }

  Widget animacion = Container();

  seleccionoOpcion(Offset position, Opcion widget){
    widget.color = Colors.black;
    animacion = Container(
      child: widget,
      margin: EdgeInsets.only(
        top: position.dy,
        left: position.dx
      ),
    );

    notifyListeners();
  }
    
}

class Opcion extends StatelessWidget {

  Opcion({
    Key? key, 
    required this.text,
    this.mostrar = true,
    this.color = Colors.blue
  });

  final String text;
  bool mostrar;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
      color: this.color,
      padding: EdgeInsets.all(10),
    );
  }
}

class Respuesta extends StatelessWidget {

  Respuesta({
    Key? key, 
    required this.text,
    this.mostrar = true,
    this.color = Colors.blue
  });

  final String text;
  bool mostrar;
  Color color;

  void getPosition(BuildContext context){
     // Obtener el offset obsoluto de este widget
    final box =  context.findRenderObject() as RenderBox;
    final offset = box.localToGlobal(Offset.zero);
    final tam = box.size;
    print(offset);
    print(tam);
  }
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
      color: this.color,
      padding: EdgeInsets.all(10),
    );
  }
}