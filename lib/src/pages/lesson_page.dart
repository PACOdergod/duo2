
import 'package:duo2/src/quiz/lesson_appbar.dart';
import 'package:duo2/src/quiz/response_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/quiz/quiz_section.dart';

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
  
  @override
  Widget build(BuildContext context) {

    lessonService = Provider.of<LessonService>(context, listen: false);
    var quizes = lessonService.lesson.quizes;

    return Scaffold(
      body: Container(

        width: MediaQuery.of(context).size.width,
        color: Colors.white,

        child: Column(
          children: [

            //appbar
            LessonAppbar(tam: quizes.length,),

            SizedBox(height: 10,),

            // Quiz section
            Expanded(
              child: QuizSection(
                quizes: quizes,
              )
            )

          ],
        ),
      )
      
    );
  }
}
