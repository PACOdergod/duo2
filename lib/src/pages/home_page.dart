import 'package:duo2/src/controllers/advance_controller.dart';
import 'package:duo2/src/pages/lesson_aux.dart';
import 'package:duo2/src/pages/lesson_page.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/widgets/module.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    var advanceController = Get.find<AdvanceController>();

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.flag),
        title: Text("appbar"),
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: ()=>advanceController.aumentarPorcentaje("numeros"),
      // ),
      
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: _Modules()
        ),
      ),
    );
  }

}

class _Modules extends StatelessWidget {

  final advanceController = Get.find<AdvanceController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Column(
      children: [

        SizedBox(height: 20),

        GestureDetector(
          child: Module(
            level: advanceController.getNivel("numeros"),
            porcentaje: advanceController.getPorcentaje("numeros"),
          ),
          onTap: () => _myAlert(context, "numeros")
        ),

        SizedBox(height: 20),
        Module(),
        SizedBox(height: 20),
        Module(),
        SizedBox(height: 20),
        Module(),
        SizedBox(height: 20),
        Module(),

      ],
    ),);
  }
}


_myAlert(BuildContext context, String id) {
  return showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 400),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: BoxDescription(id),
        )
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
        child: child,
      );
    },
  );
}

class BoxDescription extends StatelessWidget {

  final String id;

  const BoxDescription(this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 225,
      width: MediaQuery.of(context).size.width*.8,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20)
      ),

      child: Column(
        children: [
          _levels(context, id),
          PrincipalButton(
            porcentajeAncho: .9,
            marginh: 0,
            color: Colors.blue,
            borderColor: Colors.black12,
            text: "APUNTES",
            //TODO crear la pagina de apuntes
          ),
          PrincipalButton(
            porcentajeAncho: .9,
            marginh: 0,
            color: Colors.white,
            borderColor: Colors.black12,
            text: "EMPEZAR",
            textColor: Colors.black,
            onTap: () {
              Navigator.pop(context); //cerrar el dialog
              Get.to(()=> LessonAuxiliar(), arguments: id);
            },
          )

        ],
      ),
    );
  }
}

Column _levels(BuildContext context, String id) {

  final advanceController = Get.find<AdvanceController>();

  String? leccT = '${advanceController.levels[id]?.totalLessons}';
  String? leccH = '${advanceController.levels[id]?.lessonsDone}';
  String? nivT = '${advanceController.levels[id]?.totalLevels}';
  String? nivU = '${advanceController.levels[id]?.levelUser}';

  return Column(
    children: [
      Text( "Nivel" +nivU+"/"+nivT,
        style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold,
          color: Colors.white
        )
      ),
      Text("Leccion "+leccH+"/"+leccT, 
        style: TextStyle(
          fontSize: 17,
          color: Colors.white
        )
      )
    ],
  );
}
