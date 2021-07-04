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
            ),

            SizedBox(height: 70),

            Options(currentQuiz.opciones, (MediaQuery.of(context).size.width*.85)),

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

class Options extends StatefulWidget {

  final List<String> options;
  final double ancho;

  const Options( this.options, this.ancho );

  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 180,
      width: widget.ancho,
      // color: Colors.blue,
      child: Wrap(
        alignment: WrapAlignment.center,

        children: widget.options.map((e) => _option(e)).toList()
      )
    );
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
}

