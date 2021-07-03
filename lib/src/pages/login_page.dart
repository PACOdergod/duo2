import 'package:duo2/src/pages/home_page.dart';
import 'package:duo2/src/widgets/campos_text.dart';
import 'package:flutter/material.dart';
import 'package:duo2/src/widgets/principal_button.dart';
import 'package:get/get.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // cuando abre el teclado no movera ningun widget
      resizeToAvoidBottomInset: false, 

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.ac_unit, color: Colors.black),
          onPressed: ()=> Navigator.pop(context),
        ),
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
                  SizedBox(height: 10),
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

          GestureDetector(
            child: Text("RESTABLECER CONTRASEÑA", 
              style: TextStyle(color: Colors.lightBlue[400], fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              // TODO crear la pagina de reestablecer contraseña
            },
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
          onTap: (){
            //TODO llamar a firebase para registrar usuario
            Get.to(()=> HomePage());
          },
        ),

        _LoginWithButton(
          text: "GOOGLE",
          icon: Container(
            color: Colors.white,
            child: Image.asset('assets/google.jpeg')
          ),
          textColor: Colors.black87,
          onTap: (){
            //TODO llamar a firebase para registrar usuario
            Get.to(()=> HomePage());
          },
        )
      ],
    );
  }
}


class _IngresarButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return PrincipalButton(
      text: "INGRESAR",
      onTap: (){
        // TODO: verificar que los compos sean validos y el usuario este registrado
        Get.to(()=> HomePage());
      },
    );
  }
}

class _LoginWithButton extends StatelessWidget {

  final String text;
  final Widget icon;
  final Color textColor;
  final Function()? onTap;

  const _LoginWithButton({
    required this.text, 
    required this.icon, 
    required this.textColor, 
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return PrincipalButton(
      text: this.text,
      textSize: 15,
      porcentajeAncho: 0.4,
      paddingh: 5,
      color: Colors.white,
      textColor: this.textColor,
      borderColor: Colors.grey[300]!,
      icon: this.icon,
      marginh: 0,
      onTap: this.onTap,
    );
  }
}

class _Footer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Text(
          "Al registrarte en Duo2, aceptas\n"+
          "nuestros Terminos y Politicas de privacidad",
          textAlign: TextAlign.center,
        )
    );
  }
}
