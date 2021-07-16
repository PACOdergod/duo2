part of 'quiz_cubit.dart';


@immutable
abstract class QuizState {
  final List<String> options;
  QuizState(this.options);

  List<EjemploBoton> totalOpciones = [];
  List<Respuesta> misRespuestas = [];
  List<Option> misOpciones = [];

  Container comprobar(BuildContext context) {
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
