
import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {

  int index = 0;

  LessonCubit() : super( NewLesson(0) );

  void siguienteQuiz(){
    emit( NewLesson(1));
  }

  // final lesson = LessonController.getLesson();
  //   int currentIndexQuiz = 0;
  //   var currentQuiz = lesson.quizes[currentIndexQuiz];
}