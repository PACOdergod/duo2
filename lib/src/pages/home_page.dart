import 'package:duo2/src/widgets/home_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:duo2/src/widgets/module.dart';
import 'package:duo2/src/widgets/box_description.dart';
import 'package:duo2/src/controllers/advance_controller.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    var advanceController = Get.find<AdvanceController>();

    return Scaffold(

      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.plus_one),
      //   onPressed: () {
      //     advanceController.aumentarLessonsDone("basico");
      //     advanceController.coronasUser++;
      //   },
      // ),
      
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: _Modules()
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "hola"
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.ac_unit),
      //       label: "hola"
      //     ),
      //   ] 
      // ),

    );
  }

}

class _Modules extends StatelessWidget {

  final advanceController = Get.find<AdvanceController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=> Column(
      children: [

        SafeArea(child: HomeAppBar(
          coronas: advanceController.coronasUser.value,
        )),

        SizedBox(height: 15),

        GestureDetector(
          child: Module(
            level: advanceController.getNivel("basico"),
            porcentaje: advanceController.getPorcentaje("basico"),
          ),
          onTap: () => _myAlert(context, "basico")
        ),
        _myTitle("Basico"),

        SizedBox(height: 20),

        Module(
          level: advanceController.getNivel("letras"),
          porcentaje: advanceController.getPorcentaje("letras"),
        ),
        _myTitle("Letras"),

        SizedBox(height: 20),

        Module(),
        _myTitle("Colores"),

        SizedBox(height: 20),
        Module(),
        SizedBox(height: 20),
        Module(),

      ],
    ),);
  }

}


_myTitle(String title){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
      SizedBox(width: 5),
      Text( title, 
        style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold ),
      ),
    ],
  );
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

