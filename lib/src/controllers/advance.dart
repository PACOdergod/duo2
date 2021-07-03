import 'package:get/get.dart';

class Advance extends GetxController{
    //TODO: se conecta a la base de datos 

  var levels = {
    "numeros" : Level(
      id: "numeros", 
      levelUser: 0, 
      lessonsDone: 0,
      totalLessons:5
    ),
    "letras" : Level(
      id: "letras", 
      levelUser: 0, 
      lessonsDone: 0,
      totalLessons:5
    ),
    "colores" : Level(
      id: "colores", 
      levelUser: 0, 
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
  void aumentarPorcentaje(String id)=> this.levels.update(id, (l){
    var nivel = levels[id];
    if (nivel == null) printError(info: 'El id del modulo no existe');

    l.lessonsDone++;

    if(l.lessonsDone == l.totalLessons){
      _aumentarNivel(id);
      l.lessonsDone = 0;
    }
    return l;
  });

}

class Level {
  String id;
  int levelUser;
  int lessonsDone;
  int totalLessons;

  Level({
    required this.id, 
    required this.levelUser, 
    required this.lessonsDone,
    required this.totalLessons,
  });
}