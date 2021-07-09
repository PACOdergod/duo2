
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/pages/section_response.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/widgets/progress_bar.dart';
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
    var quizes = lessonService.lesson.quizes;
    var index = lessonService.currentIndex;


    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          lessonService.indexSig();
        },
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
                color: Colors.white,
                child: Row(
                  children: [

                    IconButton(
                      icon: Icon(Icons.close, size: 32,),
                      onPressed: null, 
                    ),

                    LessonBar()

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

            Demo(currentQuiz: quizes[index])

          ],
        ),


        )
      
    );
  }
}

class Demo extends StatelessWidget {
  final Quiz currentQuiz;

  const Demo({
    Key? key,
    required this.currentQuiz
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      color: Colors.amber,
      child: Column(
        children: [
          Text(currentQuiz.tipo),
          Text(currentQuiz.pregunta),
        ],
      ),
    );
  }
}

class LessonBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final lessonService = Provider.of<LessonService>(context);

    return ProgressBar(
      largo: lessonService.lesson.quizes.length,
      index: lessonService.currentIndex+1,
      ancho: MediaQuery.of(context).size.width*.65,
    );
  }
}