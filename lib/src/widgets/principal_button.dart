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
  final double? paddingh;
  
  PrincipalButton({
    this.text, 
    this.textColor, 
    this.textSize = 20,
    this.color = Colors.green,
    this.icon,
    this.onTap,
    this.ancho,
    this.elevation = 5,
    this.borderColor = Colors.green, 
    this.textWeight = FontWeight.bold,
    this.paddingh = 10
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
        height: 65,
        width: widget.ancho,
        // alignment: Alignment.center,
        
        child: presionado ? _secundario() : _principal(),
        
      ),
      
    );
  }

  //TODO: refactorizar la pagina

  Container _principal() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tituloButton(),
        ],
      ),
      margin: EdgeInsets.only(bottom: widget.elevation),
      padding: EdgeInsets.symmetric(horizontal: 10),

      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor, width: 3),
        borderRadius: BorderRadius.circular(20),
        color: widget.color,
        boxShadow: [
          BoxShadow(
            offset: Offset(0,widget.elevation), 
            color: Colors.black12),
        ]
      ),
    );
  }

  Container _secundario() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tituloButton(),
        ],
      ),
      margin: EdgeInsets.only(top: widget.elevation),
      padding: EdgeInsets.symmetric(horizontal: 10),


      decoration: BoxDecoration(
        border: Border.all(color: widget.borderColor, width: 2),
        borderRadius: BorderRadius.circular(20),
        color: widget.color,
        
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

  Text texto()=> Text( widget.text??"LOGIN", 
    style: TextStyle(
      fontSize: this.widget.textSize, 
      color: widget.textColor??Colors.white,
      fontWeight: this.widget.textWeight
    ),
  );
  
}