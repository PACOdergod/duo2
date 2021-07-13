import 'package:duo2/src/quiz/response_service.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/models/leccion_mode.dart';
import 'package:provider/provider.dart';


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
    super.initState();

    _animationController = AnimationController(
      vsync: this, 
      duration: Duration(seconds: 1)
    );

    _animation = Tween<Offset>(
      begin: Offset(0, 0), end: Offset(1, 0))
      .animate( _animationController );

  }

  GlobalKey keyColumna = GlobalKey();

  late Offset position;

  final List<String> respsUser = [];
  @override
  Widget build(BuildContext context) {

    //TODO: esta parte es muy confusa hay que implementar cubit


    // Como obtenga el offset absoluto del widget que se agrega
    List<GestureDetector> respuestas = [];
    for (var i = 0; i < respsUser.length; i++) {
      var boton = GestureDetector(
        child: Option(
          text: respsUser[i], 
          animation:_animation),
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

    // List<Widget> misOpciones = [
    //   Demo(text: widget.opciones.keys.toList()[0]),
    // ];
    // widget.opciones.forEach((key, value) {
    //   var boton = value
    //   ? GestureDetector(
    //       child: Option(
    //         key: keyText,
    //         text:key, 
    //         animation: _animation,
    //       ),
    //       onTap: () {
    //         // super.setState(() {
    //         //   widget.opciones[key] = false;
    //         //   respsUser.add(key);
    //         // });
    //       }
    //   )
    //   : _sombra(key);

    //   misOpciones.add(boton);
    // });

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>new ResponseService(), lazy: false,)
      ],
      child: Stack(
        children: [
          Cuerpo(
            keyColumna: keyColumna, 
            respuestas: respuestas, 
            animationController: _animationController),
            
        ],
      ),
    );
  }

}

class Cuerpo extends StatelessWidget {
  const Cuerpo({
    Key? key,
    required this.keyColumna,
    required this.respuestas,
    required AnimationController animationController,
  }) : _animationController = animationController, super(key: key);

  final GlobalKey<State<StatefulWidget>> keyColumna;
  final List<GestureDetector> respuestas;
  final AnimationController _animationController;

  @override
  Widget build(BuildContext context) {

    final responseService = Provider.of<ResponseService>(context);

    return Stack(
      children: [
        Column(
          key: keyColumna,

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
            Demo(text: "hola", keyColumna: keyColumna,),
            // Container(
            //   width: MediaQuery.of(context).size.width*.85,
            //   child: Wrap(
            //     alignment: WrapAlignment.center,
            //     children: [
            //       SlideTransition(
            //         position: _animation,
            //         child: Demo(text: "hola")
            //       ),
            //     ]
            //   )
            // ),

            ElevatedButton(
              onPressed: (){
                if(_animationController.isCompleted)
                  _animationController.reverse();
                else _animationController.forward();
              }, 
              child: Text("preciona")),

            // Center(
            //   child: SlideTransition(
            //     position: _animation,
            //     child: Center(child: Text("My Text")),
            //   ),
            // )

          ],
        ),

        responseService.animacion
      ],
    );
  }
}

class Demo extends StatelessWidget {
  final String text;
  final GlobalKey keyColumna;
  const Demo({ 
    Key? key,
    required this.text, 
    required this.keyColumna }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final responseService = Provider.of<ResponseService>(context, listen: false);
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        // margin: EdgeInsets.all(10),
        color: Colors.green,
        child: Text(this.text),
      ),
      onTap: (){
        // Obtener el offset obsoluto de este widget
        final box = context.findRenderObject() as RenderBox;
        final offset = box.localToGlobal(Offset.zero);
        final tam = box.size;
        print(offset);

        // obtener el offset de la columna
        final boxC = keyColumna.currentContext!.findRenderObject() as RenderBox;
        final offsetC = boxC.localToGlobal(Offset.zero);
        print(offsetC);

        responseService.animar(offset-offsetC, tam);
      },
    );
  }
}

class Option extends StatelessWidget {

  final String text;
  final Animation<Offset> animation;
  Option({
    Key? key, 
    required this.text, 
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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