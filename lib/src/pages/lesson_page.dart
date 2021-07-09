
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/pages/section_response.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:provider/provider.dart';


class LessonPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final lesson = LessonController.getLesson();

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

class LessonBody extends StatefulWidget {

  final Leccion lesson;

  const LessonBody({
    required this.lesson,
  });

  @override
  _LessonBodyState createState() => _LessonBodyState();
}

class _LessonBodyState extends State<LessonBody> {
  
  @override
  Widget build(BuildContext context) {

    final lessonService = Provider.of<LessonService>(context);
    var currentQuiz = lessonService.lesson.quizes[lessonService.currentIndex];

    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: ()=> lessonService.indexSig(),
      ),
    
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
                      icon: Icon(Icons.close, size: 32,),
                      onPressed: null, 
                    ),

                    //TODO:barra de progreso
                    Text(
                      "${lessonService.currentIndex+1}" +
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
              width: MediaQuery.of(context).size.width,
              color: Colors.amber,
              child: Column(
                children: [
                  Text(currentQuiz.tipo),
                  Text(currentQuiz.pregunta),
                  // Text(currentQuiz.opciones),
                  ...currentQuiz.opciones.map((e) => Text(e)).toList()
                ],
              ),
            ))

          ],
        ),


        )
      
    );
  }
}
