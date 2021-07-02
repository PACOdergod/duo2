import 'package:flutter/material.dart';


class PrincipalButton extends StatelessWidget {

  final String? text;
  final double? textSize;
  final Color? textColor;
  final Color? color;
  final Widget? icon;
  final double porcentajeAncho;
  final Color borderColor;
  final double paddingh;
  final double marginh;
  final double marginv;

  const PrincipalButton({
    this.text, 
    this.textColor, 
    this.color, 
    this.icon,
    this.borderColor = Colors.green, 
    this.porcentajeAncho = 0.9, 
    this.textSize = 20, 
    this.paddingh = 20, 
    this.marginh = 20, 
    this.marginv = 8, 
  });

  @override
  Widget build(BuildContext context) {

    var ancho = MediaQuery.of(context).size.width;

    return GestureDetector(

      child: Container( 
        child: tituloButton(),

        width: ancho*porcentajeAncho,
        height: 60,
        margin: EdgeInsets.symmetric(
          horizontal: this.marginh, vertical: this.marginv),
        padding: EdgeInsets.symmetric(horizontal: this.paddingh),

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

  Center tituloButton() {
    if (icon == null) return Center(
      child: texto()
    );
    else return Center(

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 30,
            child: icon!
          ),
          // SizedBox(width: 5),
          texto(),
        ],
      ),
    ); 
  }


  Text texto() {
    return Text( text??"LOGIN", 
      style: TextStyle(
        fontSize: this.textSize, 
        color: textColor??Colors.white,
        fontWeight: FontWeight.bold),
    );
  }
}