import 'package:flutter/material.dart';

import 'package:duo2/src/models/leccion_mode.dart';


class ResponseArea extends StatefulWidget {

  final Quiz currentQuiz;
  late final Map<String, bool> opciones;

  ResponseArea({  
    required this.currentQuiz,
  }){
    this.opciones = Map.fromIterable(currentQuiz.opciones,
      key: (item) => item.toString(),
      value: (item) => true
    );
  }

  @override
  _ResponseAreaState createState() => _ResponseAreaState();
}

class _ResponseAreaState extends State<ResponseArea> {
  final List<String> respsUser = [];

    Widget _option(String text) {
      return Container(
        color: Colors.blue,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Text(text, style: TextStyle(fontSize: 20),)
        // PrincipalButton(
        //   color: Colors.white,
        //   borderColor: Colors.black12,
        //   textColor: Colors.black,
        //   text: text,
        // ),
      );
    }

  @override
  Widget build(BuildContext context) {
    

    //TODO: esta parte es muy confusa hay que implementar cubit
    List<GestureDetector> respuestas = [];
    for (var i = 0; i < respsUser.length; i++) {
      var boton = GestureDetector(
        child: _option(respsUser[i]),
        onTap: () {
          // print("option");

          String palabra = respsUser[i];

          if (widget.opciones.containsKey(palabra)){
            widget.opciones[palabra] = true;
            respsUser.remove(palabra);
          }

          super.setState(() {});
        }
      );

      respuestas.add(boton);
    }

    List<Opacity> misOpciones = [];
    widget.opciones.forEach((key, value) {

      // TODO: aunque no se vea el boton sigue estando ahi
      var boton = Opacity(
        opacity: value?1:0,
        child: GestureDetector(
          child: _option(key),
          onTap: () {
            super.setState(() {
              widget.opciones[key] = false;
              respsUser.add(key);
            });
            // print("option");

          }
        ),
      );

      misOpciones.add(boton);
    });


    return Column(
      children: [
        // linear donde se acomodaran las respuestas
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.black12, width: 3)
            )
          ),

          child: Row(
            children: respuestas
          ),
        ),

        SizedBox(height: 60),

        // OPCIONES
        Container(
          width: MediaQuery.of(context).size.width*.85,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: misOpciones
          )
        ),

      ],
    );
  }
}