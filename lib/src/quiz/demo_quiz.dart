import 'package:flutter/material.dart';


class DemoQuiz extends StatefulWidget {

  @override
  _DemoQuizState createState() => _DemoQuizState();
}

class _DemoQuizState extends State<DemoQuiz> {

  bool probando = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: 
      // Container(
      //   margin: EdgeInsets.only(
      //     left: 126,
      //     top: 282.5
      //   ),
      //   height: 39,
      //   width: 108,
      //   color: Colors.blue,
      // ) 
      Center(
        child: Boton(),
      ),
    );
  }
}

class Boton extends StatelessWidget {
  const Boton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text('Hola Mundo'),
        padding: EdgeInsets.all(10),
        color: Colors.amber,
      ),
      onTap: (){
        final box = context.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero);
        print(offset);
        print(box.size);
      },
    );
  }
}