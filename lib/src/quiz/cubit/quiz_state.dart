part of 'quiz_cubit.dart';


@immutable
abstract class QuizState {
  List<Option> misOpciones = [];
  late List<Respuesta> misRespuestas = [];
  late final Widget boton;
  final Quiz currentQuiz;

  QuizState(this.currentQuiz);
}

class QuizInitial extends QuizState {

  QuizInitial(Quiz currentQuiz) : super(currentQuiz) 
  {
    int i = 0;
    currentQuiz.opciones.forEach((opcion) {
      var boton = Opcion(index: i);
      misOpciones.add(boton);
      i++;
    });
  }

  @override
  Widget get boton => BotonNull();
}

class QuizWithResponses extends QuizState {
  QuizWithResponses({
    required List<Respuesta> newRespuestas, 
    required List<Option> newOpciones,
    required Quiz currentQuiz
  }) : super(currentQuiz)
  {
    misRespuestas = newRespuestas;
    misOpciones = newOpciones;
  }

  @override
  Widget get boton => Comprobar();
}

class QuizWithoutResponses extends QuizState {
  QuizWithoutResponses({
    required List<Respuesta> newRespuestas, 
    required List<Option> newOpciones,
    required Quiz currentQuiz
  }) : super(currentQuiz)
  {
    misRespuestas = newRespuestas;
    misOpciones = newOpciones;
  }

  @override
  Widget get boton => BotonNull();
}

class QuizCorrect extends QuizState {
  QuizCorrect({
    required List<Respuesta> newRespuestas, 
    required List<Option> newOpciones,
    required Quiz currentQuiz
  }) : super(currentQuiz)
  {
    misRespuestas = newRespuestas;
    misOpciones = newOpciones;
  }

  @override
  Widget get boton => Siguiente();
}

class FinalQuiz extends QuizState{
  FinalQuiz({
    required List<Respuesta> newRespuestas, 
    required List<Option> newOpciones,
    required Quiz currentQuiz
  }) : super(currentQuiz)
  {
    misRespuestas = newRespuestas;
    misOpciones = newOpciones;
  }

  @override
  Widget get boton => Finalizar();
}

class AnimateAddResponse extends QuizState {
  AnimateAddResponse(Quiz currentQuiz) : super(currentQuiz);

  
}

class NewQuiz extends QuizState {

  final QuizState currentQuizSate;
  final Quiz actualQuiz;
  final Quiz nextQuiz;

  NewQuiz(this.actualQuiz, this.currentQuizSate, this.nextQuiz) 
  : super(actualQuiz)
  {
    int i = 0;
    currentQuiz.opciones.forEach((opcion) {
      var boton = Opcion(index: i);
      misOpciones.add(boton);
      i++;
    });
  }

  @override
  Widget get boton => BotonNull();
}