import 'package:duo2/src/quiz/quiz_botones.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:duo2/src/quiz/response_service.dart';


class ResponseArea extends StatefulWidget {
  @override
  _ResponseAreaState createState() => _ResponseAreaState();
}

class _ResponseAreaState extends State<ResponseArea> {

  @override
  Widget build(BuildContext context) {

    final responseService = Provider.of<ResponseService>(context);

    //TODO quitar este container
    return Stack(
      children: [

        Cuerpo(),

        responseService.animacionf,

      ],
    );
  }
}


class Cuerpo extends StatelessWidget {

  final GlobalKey keyColumna = GlobalKey();

  @override
  Widget build(BuildContext context) {

    final responseService = Provider.of<ResponseService>(context);
    responseService.keyColumna = keyColumna;

    return Column(
      key: keyColumna,
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
            children: responseService.misRespuestas.map((e) => 
              Container(
                child: e,
                margin: EdgeInsets.all(10),
              )
            ).toList()
          ),
        ),

        SizedBox(height: 60),

        // OPCIONES
        Wrap (
          children: responseService.misOpciones.map((e) => 
            Container(
              child: e,
              margin: EdgeInsets.all(10),
            )
          ).toList()
        )
      ],
    );

  }
}