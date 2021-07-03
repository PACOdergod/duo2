import 'package:duo2/src/pages/home_page.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonAuxiliar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Por ahora se esta diseñando la pagina de lecciones,"+
          "para probar la funcionalidad del home page presione el boton"),
          PrincipalButton(
            text: "Completar leccion",
            onTap: () {
              // TODO:
              // incrementar el numero de lecciones completadas en esta unidad
              // redibujar el homepage
              Get.to(()=> HomePage());
            },
          ),
        ],
      ),
    );
  }
}