
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

class _LessonBodyState extends State<LessonBody> 
  with SingleTickerProviderStateMixin
{
 
  int index = 0;
 
  
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

            // if (controller.isCompleted) {
            //   controller.reverse();
            // }else{
            //   controller.forward();
            // }

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

            SlideWidgets(index: index)

            // Expanded(
            //   child: SectionResponse(
            //     currentQuiz: currentQuiz,
            //   )
            // )

            
            

          ],
        ),
      )
      
    );
  }
}

class SlideWidgets extends StatefulWidget {

  final int index;

  const SlideWidgets({required this.index});

  @override
  _SlideWidgetsState createState() => _SlideWidgetsState();
}

class _SlideWidgetsState extends State<SlideWidgets> 
  with SingleTickerProviderStateMixin
{
  List<Color> colores = [
    Colors.white,
    Colors.black,
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  late AnimationController controller;
  List<Widget> cuadrados = [];


  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, 
      duration: Duration(seconds: 1),
    );

    for (var i = 0; i < colores.length; i++) {
      cuadrados.add(new Cuadrado(
        color: colores[i],
        key: ValueKey<int>(i),
      ));
    }
  }

  

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    return Stack(
      children: [

        SlideTransition(
          position: Tween(begin: Offset(0, 0), end: Offset(-1, 0))
          .animate(controller),
          child: cuadrados[widget.index],
        ),
        SlideTransition(
          position: Tween(begin: Offset(1, 0), end: Offset(0, 0))
          .animate(controller),
          child: cuadrados[widget.index+1],
        )

      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}

class Cuadrado extends StatelessWidget {
  final Color color;

  const Cuadrado({Key? key, this.color=Colors.green}): super(key: key);

    @override
    Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height-140,
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