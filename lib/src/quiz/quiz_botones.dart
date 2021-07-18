import 'package:duo2/src/services/lesson_service.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import 'package:duo2/src/quiz/response_service.dart';

import 'cubit/quiz_cubit.dart';


abstract class Option extends StatelessWidget{

  Option({
    Key? key, 
    this.text,
    required this.index,
  });

  String? text;
  int index;
}

class Opcion extends Option{

  Opcion({
    Key? key, 
    required this.index,
  }) : super(
    index: index
  );

  int index;

  @override
  Widget build(BuildContext context) {

    final cubit = BlocProvider.of<QuizCubit>(context);

    return GestureDetector(
      child: cubit.totalOpciones[index],

      onTap: () {

        // Obtener el offset obsoluto de este widget
        final box = context.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero);
        final tam = box.size;

        cubit.agregarRespuesta(index, tam);
      },
    );
  }
}

class Sombra extends Option {
  
  Sombra({
    Key? key, 
    required this.tam,
    required this.index,
    this.color = Colors.blue
  }) : super(
    index: index
  );

  Color color;
  Size tam;
  int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tam.height,
      width: tam.width,
      color: Colors.black,
    );
  }
}


class Respuesta extends StatefulWidget {

  Respuesta({
    Key? key, 
    required this.index,
  });

  int index;

  @override
  _RespuestaState createState() => _RespuestaState();
}

class _RespuestaState extends State<Respuesta> {

  double opacidad = 1;

  @override
  Widget build(BuildContext context) {

    final cubit = BlocProvider.of<QuizCubit>(context);

    return Opacity(
      opacity: opacidad,
      child: GestureDetector(
        child: cubit.totalOpciones[widget.index],

        onTap: ()=> cubit.quitarRespuesta(widget.index)
      ),
    );
  }

  // @override
  // void afterFirstLayout(BuildContext context) async {
    
  //   final service = Provider.of<ResponseService>(context, listen: false);
  //   var res = getPosition(context);
  //   service.addPosicionFinal(res);

  //   // await Future.delayed(Duration(seconds: 2));
  //   // setState(() {
  //   //   opacidad = 1;
  //   // });
  // }

  // Offset getPosition(BuildContext context){
  //   final box =  context.findRenderObject() as RenderBox;
  //   final offset = box.localToGlobal(Offset.zero);
  //   // final tam = box.size;
  //   return offset;
  // }
}

class EjemploBoton extends StatelessWidget {

  final String text;
  const EjemploBoton({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
      color: Colors.red,
      padding: EdgeInsets.all(10),
    );
  }
}

class Comprobar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

  final lessonService = Provider.of<LessonService>(context, listen: false);

    return Container(
      margin: EdgeInsets.only(
        bottom: 10
      ),
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: PrincipalButton(
            text: "SIGUIENTE",
            ancho: MediaQuery.of(context).size.width * .9,
            onTap: () {
            // TODO: llamar al provider para que verifique la respuesta
              lessonService.indexSig(context);
            }
        ),
      ),
    );
  }
}