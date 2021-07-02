import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';

import 'package:duo2/src/widgets/module.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.flag),
        title: Text("appbar"),
      ),
      
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              GestureDetector(
                child: Module(level: 1),
                onTap: () => _myAlert(context)
              ),


              SizedBox(height: 20),
              Module(level: 1),
              SizedBox(height: 20),
              Module(level: 1),
              SizedBox(height: 20),
              Module(level: 1),
              SizedBox(height: 20),
              Module(level: 1),

            ],
          ),
        ),
      ),
    );
  }

  _myAlert(BuildContext context) {
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
            child: BoxDescription(),
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
}

class BoxDescription extends StatelessWidget {

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
          _levels(),
          PrincipalButton(
            porcentajeAncho: .9,
            marginh: 0,
            color: Colors.blue,
            borderColor: Colors.black12,
            text: "APUNTES",
          ),
          PrincipalButton(
            porcentajeAncho: .9,
            marginh: 0,
            color: Colors.white,
            borderColor: Colors.black12,
            text: "EMPEZAR",
            textColor: Colors.black,
          )

        ],
      ),
    );
  }
}
Column _levels() {
  return Column(
    children: [
      Text("Nivel 1/5", style: TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold,
        color: Colors.white
      )),
      Text("Leccion 1/3", style: TextStyle(
        fontSize: 17,
        color: Colors.white
      ))
    ],
  );
}
