
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

  List<Color> colores = [
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  List<Widget> cuadrados = [];

  int index = 0;

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < colores.length; i++) {
      cuadrados.add(new Cuadrado(
        color: colores[i],
        key: ValueKey<int>(i),
      ));
    }
  }
  
  @override
  Widget build(BuildContext context) {

    // final lessonService = Provider.of<LessonService>(context);
    // var quizes = lessonService.lesson.quizes;
    // var index = lessonService.currentIndex;


    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            index++;
          });
          // lessonService.indexSig();
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

            AnimatedSwitcher(
              duration: Duration(seconds: 2),
              child: cuadrados[index],
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
            )

          ],
        ),


        )
      
    );
  }
}

class Cuadrado extends StatelessWidget {
  final Color color;

  const Cuadrado({Key? key, this.color=Colors.green}): super(key: key);

    @override
    Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: this.color
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