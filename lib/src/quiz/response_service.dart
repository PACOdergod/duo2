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