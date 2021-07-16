import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:duo2/src/quiz/response_area.dart';
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

  @override
  Widget build(BuildContext context) {

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

              MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (_)=>new ResponseService(
                      currentQuiz.opciones
                    ),
                    lazy: false,)
                ],
                child: ResponseArea(),
              )

            ],
          ),

          
          Positioned(
            bottom: 10,
            child: _comprobar(context)
          )
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