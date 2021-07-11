import 'package:flutter/material.dart';


class PrincipalButton extends StatefulWidget {

  final String? text;
  final double? textSize;
  final Color? textColor;
  final Color? color;
  final Widget? icon;
  final Function()? onTap;
  final double? ancho;
  final double elevation;
  final Color borderColor;
  final FontWeight textWeight;
  
  PrincipalButton({
    this.text, 
    this.textColor, 
    this.textSize = 20,
    this.color = Colors.green,
    this.icon,
    this.onTap,
    this.ancho = 100,
    this.elevation = 5,
    this.borderColor = Colors.green, 
    this.textWeight = FontWeight.bold,
  });

  @override
  _PrincipalButtonState createState() => _PrincipalButtonState();
}

class _PrincipalButtonState extends State<PrincipalButton> {
  bool presionado = false;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTapDown: (_)=> setState(()=> presionado = true ),
      onTapUp:   (_)=> setState(()=> presionado = false),

      onTap: widget.onTap,
      

      child: Container(
        height: 70,
        child: Stack(
          
          children: [

            presionado ? _principal(widget.elevation) : _sombra(),

            presionado 
              ? Opacity(
                opacity: 0,
                child: _principal(0))
              : _principal(0),

          ],
        ),
      ),
      
    );
  }

  Container _principal(double marginTop) {
    return Container(
      child: tituloButton(),
      alignment: Alignment.center,
      width: this.widget.ancho,
      height: 60,
      margin: EdgeInsets.only(top: marginTop),

      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor, width: 2),
        borderRadius: BorderRadius.circular(20),
        color: widget.color,
      ),
    );
  }

  Container _sombra() {
    return Container(
      width: this.widget.ancho,
      height: 60,
      margin: EdgeInsets.only(top: widget.elevation),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
      ),
    );
  }
  

  Widget tituloButton() {

    if (widget.icon == null) return texto();

    else return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 30,
            child: widget.icon!
          ),
          texto(),
        ],
      );
  }

  Text texto() {
    return Text( widget.text??"LOGIN", 
      style: TextStyle(
        fontSize: this.widget.textSize, 
        color: widget.textColor??Colors.white,
        fontWeight: this.widget.textWeight
      ),
    );
  }
}