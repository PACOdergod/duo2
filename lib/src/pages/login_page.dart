import 'package:duo2/src/widgets/campos_text.dart';
import 'package:flutter/material.dart';
import 'package:duo2/src/widgets/principal_button.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Ingresa tus datos', 
          style: TextStyle(color: Colors.grey),
        ),
      ),

      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            _Body(),

            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _LoginWith(),
                  _Footer()
                ],
              )
            )
              
          ],
        ),
      )
    );
  }
}

class _Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(width: double.infinity, height: 15,),

          Campos(),

          SizedBox(height: 15),

          _IngresarButton(),

          SizedBox(height: 30,),

          Text("RESTABLECER CONTRASEÑA", 
            style: TextStyle(color: Colors.lightBlue[400], fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginWith extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _LoginWithButton(
          text: "FACEBOOK",
          icon: Icon(Icons.facebook, color: Colors.blue[700],),
          textColor: Colors.blue[700]!,
        ),
        _LoginWithButton(
          text: "GOOGLE",
          //TODO: hacer el logo de google
          icon: Icon(Icons.facebook, color:Colors.blue[700],),
          textColor: Colors.black87,
        )
      ],
    );
  }
}


class _IngresarButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrincipalButton(text: "INGRESAR",);
  }
}

class _LoginWithButton extends StatelessWidget {

  final String text;
  final Widget icon;
  final Color textColor;

  const _LoginWithButton({
    required this.text, 
    required this.icon, 
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return PrincipalButton(
      text: this.text,
      textSize: 15,
      porcentajeAncho: 0.4,
      paddingh: 10,
      color: Colors.white,
      textColor: this.textColor,
      borderColor: Colors.grey[300]!,
      icon: this.icon,
      marginh: 0,
    );
  }
}

class _Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Text(
          "Al registrarte en Duo2, aceptas nuestros" + 
          "Terminos y Politicas de privacidad",
        )
    );
  }
}
