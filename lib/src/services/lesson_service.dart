import 'package:flutter/widgets.dart';

// import 'package:get/get.dart';

// import 'package:duo2/src/pages/final_page.dart';
import 'package:duo2/src/models/leccion_mode.dart';

class LessonService with ChangeNotifier {
  
  late final Leccion lesson;
  final String idModule;
  int currentIndex = 0;

  LessonService(this.lesson, this.idModule);

  Quiz get currentQuiz => lesson.quizes[currentIndex];

  void indexSig(){
    currentIndex++;
    notifyListeners();
  } 

}