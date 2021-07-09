
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/pages/section_response.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:provider/provider.dart';


class LessonPage extends StatefulWidget {

  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {

  @override
  Widget build(BuildContext context) {

    final lesson = LessonController.getLesson();
    // int currentIndexQuiz = 0;
    // var currentQuiz = lesson.quizes[currentIndexQuiz];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> new LessonService(lesson),
          lazy: false,
        )
      ],

      child: LessonBody(
        lesson: lesson, 
      ),
    );
  }
}

class LessonBody extends StatelessWidget {

  final Leccion lesson;

  const LessonBody({
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {

    final lessonService = Provider.of<LessonService>(context);

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
                    Text(
                      "${lessonService.currentIndex+1}"+
                      "/${lessonService.lesson.quizes.length}"
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(height: 10,),

            // Expanded(
            //   child: SectionResponse(
            //     currentQuiz: currentQuiz,
            //   )
            // )

            Expanded(child: Container(
              color: Colors.amber,
              child: Text(lessonService.currentQuiz.tipo),
            ))

          ],
        ),


        )
      
    );
  }
}
