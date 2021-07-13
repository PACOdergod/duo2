import 'package:flutter/material.dart';


class DemoQuiz extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
          Cuerpo(),
        ],
      ),
      
    );
  }
}

class Cuerpo extends StatefulWidget {

  @override
  _CuerpoState createState() => _CuerpoState();
}

class _CuerpoState extends State<Cuerpo> {

  double arriba = 280.5;
  double isq = 126.0;

  late double arribaCuerpo;
  late double arribaBoton;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    final offset = box.localToGlobal(Offset.zero);
    // print(offset);

    arribaCuerpo = offset.dy;
    // print(arribaCuerpo);
    Singleton().arribaCuerpo = offset.dy;

    return Stack(
      children: [

        Column(
          // Ancestro comun del que se tiene que calcular todo
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.green[100],
              child: Center(
                child: Boton(),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.green[100],
              child: Center(
                child: Boton(),
              ),
            ),

            ElevatedButton(
              onPressed: (){
                // setState(() {
                //   arriba = 80.5;
                // });

                Singleton().empezar();
              },
              child: Text("animacion"),
            )

          ],
        ),

        // Animacion(isq: isq, arriba: arriba)
        Singleton().animacion
      ],
    );
  }
}

class Animacion extends StatelessWidget {
  const Animacion({
    Key? key,
    required this.isq,
    required this.arriba,
  }) : super(key: key);

  final double isq;
  final double arriba;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      margin: EdgeInsets.only(
        left: isq, top: arriba
      ),
      height: 20,
      width: 100,
      color: Colors.blue,
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
        // print(box.size);
        Singleton().arribaBoton = offset.dy;
      },
    );
  }
}

class Singleton {
  static final Singleton _singleton = Singleton._internal();
  factory Singleton() {
    return _singleton;
  }
  Singleton._internal();


  late double _arribaCuerpo;
  set arribaCuerpo(double arriba){
    _arribaCuerpo = arriba;
    print("arriba cuerpo:{$arriba}");
  }
  late double _arribaBoton;
  set arribaBoton(double arriba){
    _arribaBoton = arriba;
    print("arriba boton:{$arriba}");
  }

  bool _empezar = false;
  empezar()=> _empezar = true;

  // para cambiar el widget debo utilizar provider
  Widget get animacion=> _empezar?
    Container(
      margin: EdgeInsets.only(
        left: 126, top: _arribaBoton - _arribaCuerpo
      ),
      height: 20,
      width: 100,
      color: Colors.blue,
    )
    // AnimatedContainer(
    //   duration: Duration(seconds: 2),
    //   margin: EdgeInsets.only(
    //     left: 126, top: _arribaBoton - _arribaCuerpo
    //   ),
    //   height: 20,
    //   width: 100,
    //   color: Colors.blue,
    // )
    : Container();
}