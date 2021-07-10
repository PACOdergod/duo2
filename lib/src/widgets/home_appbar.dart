import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  final int coronas;

  const HomeAppBar({
    required this.coronas
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.black12, width: 3)
        )
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        //TODO: los iconos deben ser dibujados en el canvas
        children: [

          Image.asset('assets/banera.jpeg', width: 70,),

          Row( children: [
              Image.asset('assets/corona.png', width: 25),
              SizedBox(width: 10),
              Text( this.coronas.toString(), 
                style: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              )
          ],),

          Row( children: [
              Image.asset('assets/fuego.jpeg', width: 25),
              SizedBox(width: 10),
              Text( "0", 
                style: TextStyle(
                  color: Colors.black26,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              )
          ],),

          Row( children: [
              Image.asset('assets/corazon.png', width: 25),
              SizedBox(width: 10),
              Text( "5", 
                style: TextStyle(
                  color: Colors.red, 
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              )
          ],)

        ],
      ),
    );
  }
}