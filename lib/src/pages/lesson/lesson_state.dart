
part of 'lesson_cubit.dart';

@immutable
abstract class LessonState{}

class LessonInit extends LessonState {
  List<String> opciones = [];
  List<String> respUser = [];
}