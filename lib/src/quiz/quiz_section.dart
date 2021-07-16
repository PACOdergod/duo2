import 'package:duo2/src/quiz/cubit/quiz_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import 'package:duo2/src/quiz/response_service.dart';
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/widgets/principal_button.dart';

class QuizSection extends StatelessWidget {
  final Quiz currentQuiz;

  QuizSection({
    Key? key,
    required this.currentQuiz,
  });

  final GlobalKey keyColumna = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => new QuizCubit(currentQuiz.opciones),
      child: BlocBuilder<QuizCubit, QuizState>(

        builder: (context, state) {
          return Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              Column(
                children: [
                  SizedBox(height: 10),

                  // Tipo de pregunta
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      currentQuiz.tipo,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // pregunta
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      currentQuiz.pregunta,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),

                  SizedBox(height: 10),

                  // linear donde se acomodaran las respuestas
                  // Container(
                  //   margin: EdgeInsets.symmetric(horizontal: 20),
                  //   height: 80,
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       border: Border(
                  //           bottom:
                  //               BorderSide(color: Colors.black12, width: 3))),
                  //   child: Row(
                  //       children: state.misRespuestas
                  //           .map((e) => Container(
                  //                 child: e,
                  //                 margin: EdgeInsets.all(10),
                  //               ))
                  //           .toList()),
                  // ),

                  // SizedBox(height: 60),

                  // // OPCIONES
                  // Wrap(
                  //     children: state.misOpciones
                  //         .map((e) => Container(
                  //               child: e,
                  //               margin: EdgeInsets.all(10),
                  //             ))
                  //         .toList()),

                  Expanded(child: Container()),

                  state.comprobar(context),
                ],
              ),
            ]),
          );
        },
      ),
    );
  }
}

