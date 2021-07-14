import 'package:duo2/src/quiz/response_service.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/models/leccion_mode.dart';
import 'package:provider/provider.dart';


class ResponseArea extends StatefulWidget {

  final Quiz currentQuiz;
  late final Map<String, bool> opciones;

  ResponseArea({  
    required this.currentQuiz,
  }){
    this.opciones = 
    Map.fromIterable(currentQuiz.opciones,
      key: (item) => item.toString(),
      value: (item) => true
    );
  }

  @override
  _ResponseAreaState createState() => _ResponseAreaState();
}

class _ResponseAreaState extends State<ResponseArea> {

  GlobalKey keyColumna = GlobalKey();
  late Offset position;

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=>new ResponseService(widget.opciones),
          lazy: false,)
      ],
      child: Stack(
        children: [
          Cuerpo(
            keyColumna: keyColumna, 
          ),
            
          // TODO: aqui ira la animacion
        ],
      ),
    );
  }

}

class Cuerpo extends StatelessWidget {
  const Cuerpo({
    Key? key,
    required this.keyColumna,
  }) : super(key: key);

  final GlobalKey<State<StatefulWidget>> keyColumna;

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
                Opacity(
                  opacity: e.mostrar? 1 : 0,
                  child: GestureDetector(
                    child: e,
                    onTap: (){
                      responseService.addRespuesta(e.text);
                    },
                  ),
                )
              ).toList(),
            )
          ],
        ),

        // TODO aqui ire la animacion
      ],
    );
  }
}

// class Demo extends StatelessWidget {
//   final String text;
//   final GlobalKey keyColumna;
//   const Demo({ 
//     Key? key,
//     required this.text, 
//     required this.keyColumna }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final responseService = Provider.of<ResponseService>(context, listen: false);
//     return GestureDetector(
//       child: Container(
//         padding: EdgeInsets.all(10),
//         // margin: EdgeInsets.all(10),
//         color: Colors.green,
//         child: Text(this.text),
//       ),
//       onTap: (){
//         // Obtener el offset obsoluto de este widget
//         final box = context.findRenderObject() as RenderBox;
//         final offset = box.localToGlobal(Offset.zero);
//         final tam = box.size;
//         print(offset);

//         // obtener el offset de la columna
//         final boxC = keyColumna.currentContext!.findRenderObject() as RenderBox;
//         final offsetC = boxC.localToGlobal(Offset.zero);
//         print(offsetC);

//       },
//     );
//   }
// }
