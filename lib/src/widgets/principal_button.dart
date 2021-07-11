import 'package:flutter/material.dart';


class PrincipalButton extends StatefulWidget {

  final String? text;
  final double? textSize;
  final Color? textColor;
  final Color? color;
  final Widget? icon;
  final Function()? onTap;
  final double? paddingh;
  final double? ancho;
  final double elevation;
  //TODO: eliminar el porcentaje ancho 
  // ahora simepre que se mande a llamar hay que especificar el ancho
  final double porcentajeAncho;
  final Color borderColor;
  //TODO: eliminar margin
  final double marginh;
  final double marginv;
  final FontWeight textWeight;
  
  PrincipalButton({
    this.text, 
    this.textColor, 
    this.color, 
    this.icon,
    this.onTap,
    // TODO: debe ser requerido
    this.ancho = 100,
    this.elevation = 5,
    this.borderColor = Colors.green, 
    this.paddingh,
    this.porcentajeAncho = 0.9, 
    this.textSize = 20, 
    this.marginh = 5, 
    this.marginv = 5,
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

      onTapDown: (details) {
        setState(()=> presionado = true);
      },
      onTapUp: (details) {
        setState(()=> presionado = false);
      },

    );
  }

  Container _principal(double marginTop)=> _formaBoton(
    child: tituloButton(),
    elevation: marginTop,
    color: Colors.green
  );
  
  _sombra()=> _formaBoton( color: Colors.black26, elevation: widget.elevation );
  
  Container _formaBoton({
    Widget? child,
    Color? color = Colors.green,
    double elevation = 5
  }) {
    return Container(
      child: child,
      alignment: Alignment.center,
      width: this.widget.ancho,
      height: 60,
      margin: EdgeInsets.only(top: elevation),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
    );
  }



  Widget tituloButton() {

    if (widget.icon == null) return texto();

    else return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 30,
            child: widget.icon!
          ),
          // SizedBox(width: 5),
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