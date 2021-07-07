
part of 'lesson_cubit.dart';

@immutable
abstract class LessonState{
  //TODO: creo que los parametrso deben inicializarse en el cubi
  late final Leccion lesson;
  late final int index;
  late final Quiz currentQuiz;
}

class NewLesson extends LessonState {

  final lesson = LessonController.getLesson();
  final int index;
  // late final Quiz currentQuiz;

  NewLesson(this.index){
    // this.currentQuiz = lesson.quizes[index];
  }
}