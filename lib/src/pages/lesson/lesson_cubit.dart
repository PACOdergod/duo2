
import 'package:duo2/src/controllers/lesson_controller.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lesson_state.dart';

class LessonCubit extends Cubit<LessonState> {
  LessonCubit() : super( NewLesson() );

  // final lesson = LessonController.getLesson();
  //   int currentIndexQuiz = 0;
  //   var currentQuiz = lesson.quizes[currentIndexQuiz];
}