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
  final FontWeight textWeight;
  final bool autoajustar;

  PrincipalButton({
    this.text, 
    this.textColor, 
    this.color, 
    this.icon,
    this.onTap, 
    this.borderColor = Colors.green, 
    this.paddingh, 
    this.porcentajeAncho = 0.9, 
    this.textSize = 20, 
    this.marginh = 5, 
    this.marginv = 5,
    this.textWeight = FontWeight.bold,
    this.autoajustar = true
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      child: Container( 
        //TODO: arreglar esto
        child: autoajustar 
        ? Center(child: tituloButton(),)
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [tituloButton()],
        ),
        
        width: autoajustar?MediaQuery.of(context).size.width*.9:null,
        height: 60,
        margin: EdgeInsets.symmetric(
          horizontal: this.marginh, 
          vertical: this.marginv
        ),
        padding:EdgeInsets.symmetric(horizontal: 20),

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

  Widget tituloButton() {

    if (icon == null) return texto();

    else return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 30,
            child: icon!
          ),
          // SizedBox(width: 5),
          texto(),
        ],
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