import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/pages/section_response.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

            Expanded(
              child: SectionResponse(
                currentQuiz: currentQuiz,
              )
            )

          ],
        ),


        )
      
    );
  }
}
