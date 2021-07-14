import 'package:duo2/src/quiz/response_service.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/models/leccion_mode.dart';
import 'package:provider/provider.dart';


class ResponseArea extends StatefulWidget {

  final Quiz currentQuiz;

  ResponseArea({ required this.currentQuiz });

  @override
  _ResponseAreaState createState() => _ResponseAreaState();
}

class _ResponseAreaState extends State<ResponseArea> {

  @override
  Widget build(BuildContext context) {

    final responseService = Provider.of<ResponseService>(context);

    return Container(
        color: Colors.amber[100],
        child: Stack(
          children: [

            Cuerpo(),
              
            // TODO: aqui ira la animacion
            // Container(
            //   margin: EdgeInsets.only(
            //     top: 140,
            //     left: 60.5
            //   ),
            //   height: 39, width: 47,
            //   color: Colors.red,
            // )

            responseService.animacion

          ],
        ),
      );
  }

}


class Cuerpo extends StatelessWidget {

  final GlobalKey keyColumna = GlobalKey();

  @override
  Widget build(BuildContext context) {

    final responseService = Provider.of<ResponseService>(context);

    return Stack(

      children: [
        Column(
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
                children: responseService.misRespuestas
              ),
            ),

            SizedBox(height: 60),

            // OPCIONES
            Wrap (
              children: responseService.misOpciones.map((e) =>
              // TODO con el opacity aunq no se vea sigue detectando 
                Opacity(
                  opacity: e.mostrar? 1 : 0,
                  child: BotonOpcion(
                    responseService: responseService,
                    e: e,
                    keyColumna: keyColumna,
                  ),
                )
              ).toList(),
            )
          ],
        ),

      ],
    );
  }
}

class BotonOpcion extends StatelessWidget {

  const BotonOpcion({
    Key? key,
    required this.responseService,
    required this.e,
    required this.keyColumna,
  }) : super(key: key);

  final ResponseService responseService;
  final Opcion e;
  final GlobalKey keyColumna;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: e,
      onTap: (){

        // Obtener el offset obsoluto de este widget
        final box = context.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero);
        // final tam = box.size;
        // print(offset);
        // print(tam);

        // obtener el offset de la columna
        final boxC = keyColumna.currentContext!.findRenderObject()
         as RenderBox;
        final offsetC = boxC.localToGlobal(Offset.zero);
        // print(offsetC);

        responseService.seleccionoOpcion(offset - offsetC, e);

        // responseService.addRespuesta(e.text);
      },
    );
  }
}