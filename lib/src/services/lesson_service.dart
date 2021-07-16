import 'package:duo2/src/quiz/quiz_section.dart';
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

  void indexSig(BuildContext context){
    if (currentIndex == lesson.quizes.length-1) {
      // Get.to(()=> FinalPage(), arguments: idModule);
      Navigator.of(context).pushNamed('final', arguments: idModule);

      return;
    }
    currentIndex++;
    notifyListeners();
  } 


  seccion(){
    QuizSection(currentQuiz: lesson.quizes[currentIndex]);
    notifyListeners();
  }

}