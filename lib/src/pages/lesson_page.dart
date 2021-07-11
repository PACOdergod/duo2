
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/pages/section_response.dart';

import 'package:duo2/src/widgets/progress_bar.dart';
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

  const LessonBody({
    required this.lesson,
  });

  @override
  _LessonBodyState createState() => _LessonBodyState();
}

class _LessonBodyState extends State<LessonBody> {

  late LessonService lessonService;
  late List<SectionResponse> secciones;
  
  @override
  Widget build(BuildContext context) {

    lessonService = Provider.of<LessonService>(context);
    var quizes = lessonService.lesson.quizes;
    var index = lessonService.currentIndex;

    List<SectionResponse> secciones = [];
    for (var i = 0; i < quizes.length; i++) {
      secciones.add(SectionResponse(
        currentQuiz: quizes[i],
        key: ValueKey<int>(i),
      ));
    }

    return Scaffold(
    
      body: Container(

          width: MediaQuery.of(context).size.width,
          color: Colors.white,

          child: Column(
            children: [

            //appbar
            _LessonAppbar(secciones: secciones),

            SizedBox(height: 10,),

            // Quiz section
            Expanded(
              child: SlideWidgets(
                index: index,
                widgets: secciones,
                ancho: MediaQuery.of(context).size.width,
              ),
            )

          ],
        ),
      )
      
    );
  }
}

class _LessonAppbar extends StatelessWidget {
  const _LessonAppbar({
    Key? key,
    required this.secciones,
  }) : super(key: key);

  final List<SectionResponse> secciones;

  @override
  Widget build(BuildContext context) {

    var lessonService = Provider.of<LessonService>(context);
    var index = lessonService.currentIndex;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: Colors.white,
        child: Row(
          children: [

            IconButton(
              icon: Icon(Icons.close, size: 32,),
              onPressed: ()=> Navigator.pop(context),
            ),

            ProgressBar(
              largo: secciones.length,
              index: index,
              ancho: MediaQuery.of(context).size.width*.65,
            ),

          ],
        ),
      ),
    );
  }
}