import 'package:after_layout/after_layout.dart';
import 'package:duo2/src/quiz/cubit/quiz_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import 'package:duo2/src/quiz/response_service.dart';
import 'package:duo2/src/models/leccion_mode.dart';
import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/widgets/principal_button.dart';

class QuizSection extends StatelessWidget {
  final List<Quiz> quizes;

  QuizSection({
    Key? key,
    required this.quizes,
  });

  final GlobalKey keyColumna = GlobalKey();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => new QuizCubit( quizes, 0),
      child: BlocBuilder<QuizCubit, QuizState>(

        builder: (context, state) {

          var quizSimple = _Cuerpo(
            currentQuiz: state.currentQuiz,
            state: state,
          );

          return Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [

              if (state is NewQuiz) 
                SlideWidgets(
                  currentQuiz: quizSimple,
                  nextQuiz: state.nextQuiz,
                )

              else quizSimple
              
            ]),
          );
        },
      ),
    );
  }
}

class SlideWidgets extends StatefulWidget {

  final Quiz nextQuiz;
  final _Cuerpo currentQuiz;

  const SlideWidgets({
    required this.nextQuiz,
    required this.currentQuiz,
  });

  @override
  _SlideWidgetsState createState() => _SlideWidgetsState();
}

class _SlideWidgetsState extends State<SlideWidgets> 
  with SingleTickerProviderStateMixin, AfterLayoutMixin
{

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this, 
      duration: Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [

        SlideTransition(
          position: Tween(begin: Offset(0, 0), end: Offset(-1, 0))
          .animate(CurvedAnimation(
            parent: controller, 
            curve: Curves.easeInOutSine)),
          child: widget.currentQuiz
        ),

        SlideTransition(
          position: Tween(begin: Offset(1, 0), end: Offset(0, 0))
          .animate(CurvedAnimation(
            parent: controller, 
            curve: Curves.easeInOutSine)),
          child: 
          // Container(
          //   height: 100,
          //   width: 100,
          //   color: Colors.blue,
          // )
          _Cuerpo(
            currentQuiz: widget.nextQuiz, 
            state: new QuizInitial(widget.nextQuiz)
          )
        )

      ],
    );
    
  }

  @override
  void afterFirstLayout(BuildContext context) {
    controller.forward(from: 0);
  }
}


class _Cuerpo extends StatelessWidget {
  const _Cuerpo({
    Key? key,
    required this.currentQuiz,
    required this.state,
  }) : super(key: key);

  final Quiz currentQuiz;
  final QuizState state;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom:
                      BorderSide(color: Colors.black12, width: 3))),
          child: Row(
              children: state.misRespuestas
                  .map((e) => Container(
                        child: e,
                        margin: EdgeInsets.all(10),
                      ))
                  .toList()),
        ),

        SizedBox(height: 60),

        // // OPCIONES
        Wrap(
          children: state.misOpciones.map((e) => 
            Container(
              child: e,
              margin: EdgeInsets.all(10)
            )).toList()
        ),

        Expanded(child: Container()),

        state.boton,
      ],
    );
  }
}

