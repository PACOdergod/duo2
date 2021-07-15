import 'package:tuple/tuple.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:after_layout/after_layout.dart';

import 'package:duo2/src/quiz/response_service.dart';


abstract class Option extends StatelessWidget{

  Option({
    Key? key, 
    this.text,
    required this.index,
    this.color = Colors.blue
  });

  String? text;
  Color color;
  int index;
}

class Opcion extends Option{

  Opcion({
    Key? key, 
    required this.text,
    required this.index,
    this.mostrar = true,
    this.color = Colors.blue
  }) : super(
    text: text,
    index: index
  );

  final String text;
  bool mostrar;
  Color color;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(text),
        color: this.color,
        padding: EdgeInsets.all(10),
      ),

      onTap: () {
        // Obtener el offset obsoluto de este widget
        final box = context.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero);
        final tam = box.size;

        final service = Provider.of<ResponseService>(context, listen: false);
        service.addRespuesta(text, index, tam);


        //TODO: llamar a activar la animacion
        service.seleccionoOpcion(offset, Container(
          child: Text(text),
          color: Colors.red,
          padding: EdgeInsets.all(10),
        ),);


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
    required this.text,
    required this.index,
    this.color = Colors.blue
  });

  final String text;
  Color color;
  int index;

  @override
  _RespuestaState createState() => _RespuestaState();
}

class _RespuestaState extends State<Respuesta> with AfterLayoutMixin{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(widget.text),
        color: this.widget.color,
        padding: EdgeInsets.all(10),
      ),

      onTap: (){
        final service = Provider.of<ResponseService>(context, listen: false);
        service.quitarRespuesta(widget.index, widget.text);
      },
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    
    final service = Provider.of<ResponseService>(context, listen: false);
    var res = getPosition(context);

    service.addPosicionFinal(res.item1, Container(
      child: Text(widget.text),
      color: Colors.blue,
      padding: EdgeInsets.all(10),
    ));
 
  }

  Tuple2<Offset, Size> getPosition(BuildContext context){
    final box =  context.findRenderObject() as RenderBox;
    final offset = box.localToGlobal(Offset.zero);
    final tam = box.size;

    return Tuple2<Offset, Size>(offset, tam);
  }
}