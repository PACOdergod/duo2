import 'package:duo2/src/widgets/progress_bar.dart';
import 'package:flutter/material.dart';


class ExamplePage extends StatefulWidget {

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {

  int index = 0;
  int tam = 10;
  late double ancho = MediaQuery.of(context).size.width;
  late double sizeOcupado;


  @override
  Widget build(BuildContext context) {
    sizeOcupado = (index*ancho)/tam;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            if(index == tam) index=0;
            else index++;
          });
        },
      ),

      body: Center(
        child: Stack(
        children: [
          Container(
            height: 20,
            width: ancho,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10)
            ),
          ),

          Container(
            height: 20,
            width: sizeOcupado,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ],
    ),
      )
   );
  }
}