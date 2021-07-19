import 'package:bloc/bloc.dart';
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/quiz/quiz_botones.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  
  final List<Quiz> quizes;
  List<EjemploBoton> totalOpciones = [];
  int indexQuiz;
  late Quiz currentQuiz;

  QuizCubit(this.quizes, this.indexQuiz) 
  : super(QuizInitial(quizes[indexQuiz]))
  {

    quizes[indexQuiz].opciones.forEach((opcion) {
      totalOpciones.add(EjemploBoton(text: opcion));
    });

    currentQuiz = quizes[indexQuiz];
  }

  agregarRespuesta(int index, Size size){
    var newOptions = this.state.misOpciones;
    newOptions[index] = Sombra(tam: size, index: index);

    var newResponses = this.state.misRespuestas;
    newResponses.add(Respuesta(index: index));

    emit(QuizWithResponses(
      currentQuiz: this.currentQuiz, 
      newOpciones: newOptions,
      newRespuestas: newResponses
    ));
  }

  quitarRespuesta(int index){
    var newOptions = this.state.misOpciones;
    newOptions[index] = Opcion(index: index);

    var newResponses = this.state.misRespuestas;
    newResponses.removeWhere((respuesta) => respuesta.index == index);

    if (newResponses.isEmpty)
      emit(QuizWithoutResponses(
        currentQuiz: this.currentQuiz,
        newOpciones: newOptions,
        newRespuestas: newResponses
      ));

    else
      emit(QuizWithResponses(
        currentQuiz: this.currentQuiz,
        newOpciones: newOptions,
        newRespuestas: newResponses
      ));

  }

  comprobarRespuesta(){
    //TODO comprobar que la respuesta sea correcta
    emit(QuizCorrect(      
      currentQuiz: this.currentQuiz,
      newOpciones: state.misOpciones,
      newRespuestas: state.misRespuestas
    ));
  }

  nextQuiz(){
    indexQuiz++;
    emit(NewQuiz(quizes[indexQuiz]));
  }
}
