import 'package:duo2/src/controllers/advance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duo2/src/widgets/principal_button.dart';


class FinalPage extends StatelessWidget {

  // final idModule = Get.arguments;
  final advanceController = Get.find<AdvanceController>();


  @override
  Widget build(BuildContext context) {

    final idModule =ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Haz terminado una leccion',
            style: TextStyle(fontSize: 40),
            textAlign: TextAlign.center,
          ),
          Text(idModule),
          PrincipalButton(
            ancho: MediaQuery.of(context).size.width*.9,
            text: "Continuar",
            onTap: (){
              Navigator.of(context).pushNamed('home');
              advanceController.aumentarLessonsDone(idModule);
            },
          )
        ],
      )
   );
  }
}