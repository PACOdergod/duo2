part of 'quiz_cubit.dart';


@immutable
abstract class QuizState {

  List<Respuesta> misRespuestas = [];
  List<Option> misOpciones = [];

  late Widget boton;

}

class QuizInitial extends QuizState {

  QuizInitial(List<String> options) {
    int i = 0;
    options.forEach((opcion) {
      var boton = Opcion(index: i);
      misOpciones.add(boton);
      i++;
    });
  }

  @override
  Widget get boton => Container();
}

class QuizWithResponses extends QuizState {
  QuizWithResponses(
    List<Respuesta> newRespuestas, 
    List<Option> newOpciones
  ){
    misRespuestas = newRespuestas;
    misOpciones = newOpciones;
  }

  @override
  Widget get boton => Comprobar();
}

class QuizWithoutResponses extends QuizState {
  QuizWithoutResponses(
    List<Respuesta> newRespuestas, 
    List<Option> newOpciones
  ){
    misRespuestas = newRespuestas;
    misOpciones = newOpciones;
  }

  @override
  Widget get boton => Container();
}