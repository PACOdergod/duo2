
class Leccion {
  final List<Quiz> quizes;

  Leccion(this.quizes);

  static prueba()=> Leccion([
    Quiz("traduccion", ["and","please","Hello","coffee"], "Hola", ["Hello"]),
    Quiz("traduccion", ["and","please","Hello","coffee"], "cafe", ["coffe"]),
    Quiz("traduccion", ["and","please","Hello","coffee"], "porfavor", ["please"]),
    Quiz("traduccion", ["and","please","Hello","coffee"], "y", ["and"]),
  ]);

  int get numQuiz=> quizes.length;
}

class Quiz {
  final String tipo;
  final List<String> opciones;
  final String pregunta;
  final List<String> respuestaCorrecta;

  Quiz(this.tipo, this.opciones, this.pregunta, this.respuestaCorrecta);
}