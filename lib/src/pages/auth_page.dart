import 'package:flutter/material.dart';

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
                _PrincipalButton( text: "EMPIEZA AHORA", ),
                _PrincipalButton( 
                  text: "YA TENGO CUENTA", 
                  textColor: Colors.green,
                  color: Colors.white,
                  borderColor: Colors.black12,
                )
              ],
            )
          )
        ],
      )
    );
  }
}


class _PrincipalButton extends StatelessWidget {

  final String? text;
  final Color? textColor;
  final Color? color;
  final Color borderColor;

  const _PrincipalButton(
    {this.text, this.textColor, this.color, this.borderColor = Colors.green}
  );

  @override
  Widget build(BuildContext context) {

    var ancho = MediaQuery.of(context).size.width;

    return GestureDetector(

      child: Container( 
        child: Center(
          child: Text( text??"LOGIN", 
            style: TextStyle(fontSize: 20, color: textColor??Colors.white),
          ),
        ),

        width: ancho*0.90,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),

        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(20),
          color: color??Colors.green,
          
          boxShadow: [
            BoxShadow(
              color: Colors.black12, 
              offset: Offset.fromDirection(1.5, 3)
            )
          ]
        ),
      ),
      
      onTap: () {
        
      },
    );
  }
}