import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:duo2/src/controllers/advance_controller.dart';
import 'package:duo2/src/widgets/principal_button.dart';

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
              // Get.to(()=> LessonAuxiliar(), arguments: id);
              Navigator.of(context).pushNamed('lesson');
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
