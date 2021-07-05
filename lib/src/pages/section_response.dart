import 'package:duo2/src/models/leccion_mode.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:duo2/src/widgets/principal_button.dart';

class SectionResponse extends StatefulWidget {


  final Quiz currentQuiz;

  SectionResponse({
    Key? key, 
    required this.currentQuiz,
  });

  final List<String> respsUser = [];

  final Map<String, bool> opciones = {
    "1":true, 
    "2":true,
    "3":true,
  };

  @override
  _SectionResponseState createState() => _SectionResponseState();
}

class _SectionResponseState extends State<SectionResponse> {

  @override
  Widget build(BuildContext context) {


    //TODO: esta parte es muy confusa hay que implementar cubit
    List<GestureDetector> respuestas = [];
    for (var i = 0; i < widget.respsUser.length; i++) {
      var boton = GestureDetector(
        child: _option(widget.respsUser[i]),
        onTap: () {
          String palabra = widget.respsUser[i];

          if (widget.opciones.containsKey(palabra)) {
            widget.opciones[palabra] = true;
            widget.respsUser.remove(palabra);
            super.setState(() {});

            Singleton().respuesta.remove(palabra);
          }
        }
      );

      respuestas.add(boton);
    }

    List<Opacity> misOpciones = [];
    widget.opciones.forEach((key, value) {
      var boton = Opacity(
        opacity: value?1:0,
        child: GestureDetector(
          child: _option(key),
          onTap: () {
            super.setState(() {
              widget.opciones[key] = false;
              widget.respsUser.add(key);
            });

            Singleton().respuesta.add(key);
          }
        ),
      );

      misOpciones.add(boton);
    });


    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,

      child: Stack(
        // alignment: Alignment.center,

        children: [

          Column(
            children: [

              SizedBox(height: 10),

              // Tipo de pregunta
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Text( widget.currentQuiz.tipo, 
                  style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold,),
                ),
              ),

              SizedBox(height: 20),

              // pregunta
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(widget.currentQuiz.pregunta, 
                  style: TextStyle(fontSize: 20),
                ),
              ),

              SizedBox(height: 20),

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
          ),

          
          Positioned(
            bottom: 10,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: PrincipalButton(
                text: "COMPROBAR",
                marginv: 0,
                marginh: 15,
              ),
            )
          )
        ]
      ),
    );
  }
}

PrincipalButton _option(String text) {
  return PrincipalButton(
    color: Colors.white,
    borderColor: Colors.black12,
    textColor: Colors.black,
    text: text,
    textWeight: FontWeight.normal,
    paddingh: 10,
    autoajustar: false,
  );
}


class Singleton {
  static final Singleton _singleton = Singleton._internal();
  factory Singleton() => _singleton;
  Singleton._internal();

  List<String> respuesta = [];


}