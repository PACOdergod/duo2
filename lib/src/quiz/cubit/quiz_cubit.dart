import 'package:bloc/bloc.dart';
import 'package:duo2/src/quiz/quiz_botones.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';

part 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final List<String> options;
  List<EjemploBoton> totalOpciones = [];

  QuizCubit(this.options) : super(QuizInitial(options)){
    options.forEach((opcion) {
      totalOpciones.add(EjemploBoton(text: opcion));
    });
  }

  agregarRespuesta(int index, Size size){
    var newOptions = this.state.misOpciones;
    newOptions[index] = Sombra(tam: size, index: index);

    var newResponses = this.state.misRespuestas;
    newResponses.add(Respuesta(index: index));

    emit(QuizWithResponses(newResponses, newOptions));
  }

  quitarRespuesta(int index){
    var newOptions = this.state.misOpciones;
    newOptions[index] = Opcion(index: index);

    var newResponses = this.state.misRespuestas;
    newResponses.removeWhere((respuesta) => respuesta.index == index);

    if (newResponses.isEmpty)
      emit(QuizWithoutResponses(newResponses, newOptions));

    else
      emit(QuizWithResponses(newResponses, newOptions));

  }

  comprobarRespuesta(){
    //TODO comprobar que la respuesta sea correcta
    emit(QuizCorrect(state.misRespuestas, state.misOpciones));
  }
}
