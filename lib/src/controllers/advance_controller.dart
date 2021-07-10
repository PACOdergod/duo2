import 'package:duo2/src/models/level_model.dart';
import 'package:get/get.dart';

class AdvanceController extends GetxController{
    //TODO: se conecta a la base de datos 
  var levels = {
    "basico" : Level(
      id: "basico", 
      levelUser: 0,
      totalLevels: 5, 
      lessonsDone: 0,
      totalLessons:5
    ),
    "letras" : Level(
      id: "letras", 
      levelUser: 0,
      totalLevels: 5, 
      lessonsDone: 0,
      totalLessons:5
    ),
    "colores" : Level(
      id: "colores", 
      levelUser: 0,
      totalLevels: 5, 
      lessonsDone: 0,
      totalLessons:5
    ),
  }.obs;

  int? getNivel(String id) => levels[id]?.levelUser;
  void _aumentarNivel(String id)=> this.levels.update(id, (l){
    l.levelUser++;
    return l;
  });


  double? getPorcentaje(String id) {
    var nivel = levels[id];
    if (nivel == null) printError(info: 'El id del modulo no existe');

    return (levels[id]!.lessonsDone*100)/ levels[id]!.totalLessons;
  }
  void aumentarLessonsDone(String id)=> this.levels.update(id, (l){
    var nivel = levels[id];
    if (nivel == null) printError(info: 'El id del modulo no existe');

    l.lessonsDone++;

    if(l.lessonsDone == l.totalLessons){
      _aumentarNivel(id);
      l.lessonsDone = 0;
    }
    return l;
  });


  RxInt coronasUser = 0.obs;

}
