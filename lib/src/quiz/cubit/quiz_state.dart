part of 'quiz_cubit.dart';


@immutable
abstract class QuizState {
  final List<String> options;
  QuizState(this.options);

  List<EjemploBoton> totalOpciones = [];
  List<Respuesta> misRespuestas = [];
  List<Option> misOpciones = [];
}

class QuizInitial extends QuizState {

  QuizInitial(List<String> options) : super(options) {
    int i = 0;
    options.forEach((opcion) {
      totalOpciones.add(EjemploBoton(text: opcion));
      var boton = Opcion(index: i);
      misOpciones.add(boton);
      i++;
    });
  }

  
  
}
