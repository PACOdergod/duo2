import 'package:duo2/src/widgets/principal_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//TODO: verificar que el usuario ya haya iniciado sesion
// si es asi enviar directo al home
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
              margin: EdgeInsets.only(bottom: 80),
              child: Image.asset( 'assets/dou_logo.png', 
                fit: BoxFit.cover,
              ),
            ),
          ),
          
          Positioned(
            bottom: 20,
            width: ancho,
            child: _Botons()
          )
        ],
      )
    );
  }
}

class _Botons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        //TODO: quitar este opacity
        // pero primero crear la nevegacion para crear user
        Opacity(
          opacity: 0.0,
          child: PrincipalButton( 
            text: "EMPIEZA AHORA",
            onTap: ()=>Navigator.pushNamed(context, 'registrar'),
          ),
        ),

        PrincipalButton( 
          text: "YA TENGO CUENTA", 
          textColor: Colors.green,
          color: Colors.white,
          borderColor: Colors.black12,
          onTap: ()=>Navigator.pushNamed(context, 'login'),
        )

      ],
    );
  }
}
