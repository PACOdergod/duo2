import 'package:duo2/src/models/leccion_mode.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:duo2/src/widgets/principal_button.dart';

class LessonPage extends StatefulWidget {

  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {

  @override
  Widget build(BuildContext context) {

    final lesson = LessonController.getLesson();
    int currentIndexQuiz = 0;
    var currentQuiz = lesson.quizes[currentIndexQuiz];

    List<Widget> respsUser = [_option("hola")];

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,

        child: Column(
          children: [

            //appbar
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                height: 60,
                color: Colors.amber,
                child: Row(
                  children: [

                    IconButton(
                      icon: Icon(Icons.ac_unit, size: 32,),
                      onPressed: null, 
                    ),

                    //TODO:barra de progreso
                    Text("${currentIndexQuiz+1}/${lesson.numQuiz}"),

                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),

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
                children: respsUser
              ),
            ),

            SizedBox(height: 60),

            Container(
              // color: Colors.blue,
              // height: 180,
              width: MediaQuery.of(context).size.width*.85,
              child: Wrap(
                alignment: WrapAlignment.center,

                children: currentQuiz.opciones.map((e){
                  return GestureDetector(
                    child: _option(e),
                    onTap: (){
                      //TODO: agregar esta opcion a la linea
                      // remover esta opcion de aqui
                    }
                  );
                }).toList()
              )
            ),

            Expanded(child: SizedBox()),

            PrincipalButton(
              text: "COMPROBAR",
              marginv: 20,
            )
          ],
        ),
      )
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
  
}