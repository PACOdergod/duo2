import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/models/leccion_mode.dart';


class ResponseArea extends StatefulWidget {

  final Quiz currentQuiz;
  late final Map<String, bool> opciones;

  ResponseArea({  
    required this.currentQuiz,
  }){
    this.opciones = {"hola": true};
    // Map.fromIterable(currentQuiz.opciones,
    //   key: (item) => item.toString(),
    //   value: (item) => true
    // );
  }

  @override
  _ResponseAreaState createState() => _ResponseAreaState();
}

class _ResponseAreaState extends State<ResponseArea> 
  with SingleTickerProviderStateMixin
{

  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {

    _animationController = AnimationController(
      vsync: this, 
      duration: Duration(seconds: 1)
    )
    ;
    _animation = Tween<Offset>(
      begin: Offset(0, 0), end: Offset(0, -3))
      .animate( _animationController );

    // _animationController.forward().whenComplete(() {
    //   // put here the stuff you wanna do when animation completed!
    // });
  }

  final List<String> respsUser = [];
  @override
  Widget build(BuildContext context) {
    //TODO: esta parte es muy confusa hay que implementar cubit
    List<GestureDetector> respuestas = [];
    for (var i = 0; i < respsUser.length; i++) {
      var boton = GestureDetector(
        child: _option(respsUser[i], _animation),
        onTap: () {

          String palabra = respsUser[i];

          if (widget.opciones.containsKey(palabra)){
            widget.opciones[palabra] = true;
            respsUser.remove(palabra);
          }

          super.setState(() {});
        }
      );

      respuestas.add(boton);
    }

    List<Widget> misOpciones = [];
    widget.opciones.forEach((key, value) {

      // TODO: aunque no se vea el boton sigue estando ahi
      var boton = value
      ? GestureDetector(
          child: _option(key, _animation),
          onTap: () {
            super.setState(() {
              widget.opciones[key] = false;
              respsUser.add(key);
            });
          }
      )
      : _sombra(key);

      misOpciones.add(boton);
    });


    return Column(
      children: [
        // linear donde se acomodaran las respuestas
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.black12, width: 3)
            )
          ),

          child: Row(
            children: respuestas
          ),
        ),

        SizedBox(height: 60),

        // OPCIONES
        Container(
          width: MediaQuery.of(context).size.width*.85,
          child: Wrap(
            alignment: WrapAlignment.center,
            children: misOpciones
          )
        ),

        ElevatedButton(
          onPressed: _animationController.forward, 
          child: Text("preciona")),

        // Center(
        //   child: SlideTransition(
        //   position: _animation,
        //   child: Center(child: Text("My Text")),
        // ),
        // )

      ],
    );
  }

}

Widget _option(String text, Animation<Offset> animation) {

  return SlideTransition(
    position: animation,
    child: Container(
      color: Colors.blue,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      child: 
      Text(text, style: TextStyle(fontSize: 20),),
      
      // PrincipalButton(
      //   color: Colors.white,
      //   borderColor: Colors.black12,
      //   textColor: Colors.black,
      //   text: text,
      //   onTap: null,
      // ),
    ),
  );
}

Container _sombra(String key) {
  return Container(
    child: Text( key, 
      style: TextStyle(fontSize: 20, color: Colors.black12),),
    color: Colors.black26,
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(5),
  );
}