import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


import 'package:duo2/src/quiz/response_service.dart';
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/widgets/principal_button.dart';

class QuizSection extends StatelessWidget {

  final Quiz currentQuiz;

  QuizSection({
    Key? key, 
    required this.currentQuiz, 
  });

  final GlobalKey keyColumna = GlobalKey();

  @override
  Widget build(BuildContext context) {

    final responseService = Provider.of<ResponseService>(context);
    responseService.keyColumna = keyColumna;

    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,

      child: Stack(
        children: [
          Column(
            children: [

              SizedBox(height: 10),

              // Tipo de pregunta
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Text( currentQuiz.tipo, 
                  style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold,),
                ),
              ),

              SizedBox(height: 20),

              // pregunta
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(currentQuiz.pregunta, 
                  style: TextStyle(fontSize: 20),
                ),
              ),

              SizedBox(height: 10),

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
              ),

              Expanded(child: Container()),

              Container(
                child: _comprobar(context),
                margin: EdgeInsets.only(
                  bottom: 10
                ),
              )

            ],
          ),

        ]
      ),
    );
  }

}

Container _comprobar(BuildContext context) {
  final lessonService = Provider.of<LessonService>(context,listen: false);
  
  return Container(
    width: MediaQuery.of(context).size.width,
    
    child: Center(
      child: PrincipalButton(
        text: "COMPROBAR",
        ancho: MediaQuery.of(context).size.width*.9,
        // TODO: llamar al provider para que verifique la respuesta
        onTap: ()=>lessonService.indexSig(context)
      ),
    ),
  );
}