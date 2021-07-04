import 'package:flutter/material.dart';


class PrincipalButton extends StatelessWidget {

  final String? text;
  final double? textSize;
  final Color? textColor;
  final Color? color;
  final Widget? icon;
  final Function()? onTap;
  final double? paddingh;
  final double porcentajeAncho;
  final Color borderColor;
  final double marginh;
  final double marginv;
  final bool autoAjustar;
  final FontWeight textWeight;

  const PrincipalButton({
    this.text, 
    this.textColor, 
    this.color, 
    this.icon,
    this.onTap, 
    this.borderColor = Colors.green, 
    this.porcentajeAncho = 0.9, 
    this.textSize = 20, 
    this.paddingh, 
    this.marginh = 0, 
    this.marginv = 8,
    this.autoAjustar = true,
    this.textWeight = FontWeight.bold
  });

  @override
  Widget build(BuildContext context) {

    var ancho = MediaQuery.of(context).size.width;

    return GestureDetector(

      child: Container( 
        child: tituloButton(),

        // width: autoAjustar ? ancho*porcentajeAncho : null,
        height: 60,
        margin: EdgeInsets.symmetric(
          horizontal: this.marginh, 
          vertical: this.marginv
        ),
        padding: autoAjustar
          ? null 
          : EdgeInsets.symmetric(horizontal: this.paddingh??0),

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
      
      onTap: this.onTap,
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
        fontWeight: this.textWeight
      ),
    );
  }
}