import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/quiz/quiz_botones.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  
  final List<Quiz> quizes;
  List<EjemploBoton> totalOpciones = [];
  int indexQuiz = 0;
  late Quiz currentQuiz;

  QuizCubit(this.quizes, this.indexQuiz) 
  : super(QuizInitial(quizes.first))
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
      currentQuiz: quizes[indexQuiz],
      newOpciones: newOptions,
      newRespuestas: newResponses
    ));
  }

  quitarRespuesta(int index){

    var newResponses = this.state.misRespuestas;
    newResponses.removeWhere((respuesta) => respuesta.index == index);

    if (newResponses.isEmpty){
      emit(QuizInitial(quizes[indexQuiz]));
      return;
    }

    var newOptions = this.state.misOpciones;
    newOptions[index] = Opcion(index: index);

    emit(QuizWithResponses(
      currentQuiz: quizes[indexQuiz],
      newOpciones: newOptions,
      newRespuestas: newResponses
    ));

  }

  comprobarRespuesta(){
    //TODO comprobar que la respuesta sea correcta
    if (indexQuiz == quizes.length-1) {
      // TODO termino los quizes
      emit(FinalQuiz(
        currentQuiz: quizes[indexQuiz-1],
        newOpciones: state.misOpciones,
        newRespuestas: state.misRespuestas,
      ));
      return;
    }

    emit(QuizCorrect(
      currentQuiz: quizes[indexQuiz],
      newOpciones: state.misOpciones,
      newRespuestas: state.misRespuestas
    ));
  }

  nextQuiz(){
    this.indexQuiz++;

    emit( NewQuiz(
      quizes[indexQuiz-1], this.state, quizes[indexQuiz])
    );
  }
}
