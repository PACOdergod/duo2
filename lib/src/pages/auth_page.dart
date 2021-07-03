import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var ancho = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,

      body: Stack(
        children: [

          Center( 
            child: Container(
              child: Image.asset( 'assets/dou_logo.png', 
                fit: BoxFit.cover,
              ),

              margin: EdgeInsets.only(bottom: 80),
            ),
          ),
          
          Positioned(
            bottom: 20,
            width: ancho,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PrincipalButton( 
                  text: "EMPIEZA AHORA",
                  onTap: ()=>Navigator.pushNamed(context, 'registrar'),
                ),
                PrincipalButton( 
                  text: "YA TENGO CUENTA", 
                  textColor: Colors.green,
                  color: Colors.white,
                  borderColor: Colors.black12,
                  onTap: ()=>Navigator.pushNamed(context, 'login'),
                )
              ],
            )
          )
        ],
      )
    );
  }
}
