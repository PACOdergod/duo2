import 'package:flutter/widgets.dart';

import 'package:duo2/src/models/leccion_mode.dart';

class LessonService with ChangeNotifier {
  
  late final Leccion lesson;
  int currentIndex = 0;

  LessonService(this.lesson);

  Quiz get currentQuiz => lesson.quizes[currentIndex];

  void indexSig(){
    if (currentIndex == lesson.quizes.length) {
      return;
      //TODO: mostrar la pantalla de finalizacion 
    }
    currentIndex++;
    notifyListeners();
  } 

}