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

    return Container(
        color: Colors.amber[100],
        child: Stack(
          children: [

            Cuerpo(),

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
    responseService.keyColumna = keyColumna;

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
              children: responseService.misOpciones
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

        // // Obtener el offset obsoluto de este widget
        // final box = context.findRenderObject() as RenderBox;
        // final offset = box.localToGlobal(Offset.zero);
        // final tam = box.size;
        // print(offset);
        // print(tam);

        // // obtener el offset de la columna
        // final boxC = keyColumna.currentContext!.findRenderObject()
        //  as RenderBox;
        // final offsetC = boxC.localToGlobal(Offset.zero);

        // responseService.seleccionoOpcion(offset - offsetC, e);
        responseService.addRespuesta(e.text);
      },
    );
  }
}