import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';

class LessonPage extends StatefulWidget {

  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {

    final lesson = LessonController.getLesson();
    int numQuiz = 0;
    var currentQuiz = lesson.quizes[numQuiz];

    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            // Tipo de pregunta
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text( currentQuiz.tipo, 
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),
              ),
            ),

            SizedBox(height: 20),

            // pregunta
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(currentQuiz.pregunta, 
                style: TextStyle(fontSize: 20),
              ),
            ),

            SizedBox(height: 10),
            
            // linear donde se acomodaran las respuestas
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 3)
                )
              ),
            ),

            SizedBox(height: 20),

            Options(currentQuiz.opciones, (MediaQuery.of(context).size.width*.85)),

            PrincipalButton()
          ],
        ),
      )
    );
  }
}

// TODO: las opciones se deben acomodar automaticamente
class Options extends StatelessWidget {

  final List<String> options;
  final double ancho;

  const Options( this.options, this.ancho );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: ancho,
      color: Colors.blue,
      child: Wrap(
        alignment: WrapAlignment.center,

        children: options.map((e) => Option(e)).toList()
      )
    );
  }
}

class Option extends StatelessWidget {

  final String text;

  const Option( this.text );

  @override
  Widget build(BuildContext context) {
    return PrincipalButton(
      paddingh: 5,
      // autoAjustar: false,
      color: Colors.white,
      borderColor: Colors.black12,
      textColor: Colors.black,
      text: this.text,
      textWeight: FontWeight.normal,
    );
  }
}