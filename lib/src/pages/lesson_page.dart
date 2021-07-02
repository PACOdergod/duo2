import 'package:duo2/src/controllers/lesson_controller.dart';
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

            Container(
              width: MediaQuery.of(context).size.width,
              child: Text( currentQuiz.tipo, 
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold,),
              ),
            ),

            SizedBox(height: 20),

            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(currentQuiz.pregunta, 
                style: TextStyle(fontSize: 20),
              ),
            ),

            SizedBox(height: 10),
            
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

            Container(
              height: 180,
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Option(),
                  Option(),
                  
                ],
              )
            )

          ],
        ),
      )
    );
  }
}

class Option extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        color: Colors.white,
      ),
    );
  }
}