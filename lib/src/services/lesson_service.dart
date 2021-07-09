import 'package:flutter/widgets.dart';

import 'package:duo2/src/models/leccion_mode.dart';

class LessonService with ChangeNotifier {
  
  late final Leccion lesson;
  final int currentIndex = 0;

  LessonService(this.lesson);

  Quiz get currentQuiz => lesson.quizes[currentIndex];

}