
import 'package:duo2/src/quiz/lesson_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/quiz/quiz:section.dart';

import 'package:duo2/src/widgets/slide_widgets.dart';


class LessonPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final lesson = LessonController.getLesson();
    // var idModule = Get.arguments;
    // print(idModule);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> new LessonService(lesson, "basico"),
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
  const LessonBody({ required this.lesson });

  @override
  _LessonBodyState createState() => _LessonBodyState();
}

class _LessonBodyState extends State<LessonBody> {

  late LessonService lessonService;
  late List<QuizSection> secciones;
  
  @override
  Widget build(BuildContext context) {

    lessonService = Provider.of<LessonService>(context);
    var quizes = lessonService.lesson.quizes;
    var index = lessonService.currentIndex;


    return Scaffold(
      body: Container(

          width: MediaQuery.of(context).size.width,
          color: Colors.white,

          child: Column(
            children: [

            //appbar
            LessonAppbar(secciones: secciones),

            SizedBox(height: 10,),

            // Quiz section
            // TODO: debe hacer un slide entre las 2 secciones sin crear 
            // la segunda
            Expanded(
              child: QuizSection(currentQuiz: quizes[0]),
            )

          ],
        ),
      )
      
    );
  }
}
