
class Leccion {
  final List<Quiz> quizes;

  Leccion(this.quizes);

  static prueba()=> Leccion([
    Quiz("traduccion", ["and","please","Hello","coffee"], "Hola", "Hello"),
    Quiz("traduccion", ["and","please","Hello","coffee"], "Hola", "Hello"),
    Quiz("traduccion", ["and","please","Hello","coffee"], "Hola", "Hello"),
    Quiz("traduccion", ["and","please","Hello","coffee"], "Hola", "Hello"),
    Quiz("traduccion", ["and","please","Hello","coffee"], "Hola", "Hello"),
  ]);

  int get numQuiz=> quizes.length;
}

class Quiz {
  final String tipo;
  final List<String> opciones;
  final String pregunta;
  final String respuesta;

  Quiz(this.tipo, this.opciones, this.pregunta, this.respuesta);
}