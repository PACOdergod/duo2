import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:duo2/src/pages/lesson/lesson_cubit.dart';
import 'package:duo2/src/pages/section_response.dart';

import 'package:duo2/src/controllers/lesson_controller.dart';

class LessonPage extends StatefulWidget {
  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    // final lesson = LessonController.getLesson();
    // int currentIndexQuiz = 0;
    // var currentQuiz = lesson.quizes[currentIndexQuiz];

    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => new LessonCubit())],
      child: BlocBuilder<LessonCubit, LessonState>(
        builder: (context, state) {
          
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
                          icon: Icon(
                            Icons.ac_unit,
                            size: 32,
                          ),
                          onPressed: null,
                        ),

                        //TODO:barra de progreso
                        Text("${state.index + 1}/${state.lesson.numQuiz}"),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                Expanded(
                  child: SectionResponse(
                    currentQuiz: state.lesson.quizes[state.index],
                  )
                )

              ],
            ),
          ));
        },
      ),
    );
  }
}
