import 'package:flutter/material.dart';

class Campos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final ancho = MediaQuery.of(context).size.width;

    return Container(
      width: ancho*.9,
      // height: 150,
      // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!, width: 2),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _correo(),
          Divider(thickness: 2, color: Colors.grey[300],),
          _contrasena()
        ],
      ),
    );
  }


  Widget _correo(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 50,
      
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          labelText: "Usuario o correo",
          labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
          contentPadding: EdgeInsets.all(0)
        ),
      ),
    );
  }

  Widget _contrasena(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 50,
      child: Row(
        children: [

          Flexible(
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
                labelText: "Contraseña",
                labelStyle: TextStyle(fontSize: 20, color: Colors.grey),
                contentPadding: EdgeInsets.all(0),
              ),
            ),
          ),

          Icon(Icons.remove_red_eye, size: 50, color: Colors.lightBlue[300],)
        ],
      ),
    );
  }
}



// Widget _crearContrasena(BuildContext context) {
//   return Container(
//     padding: EdgeInsets.all(10.0),
//     child: TextField(
//     //onChanged: bloc.changePassword,
//       obscureText: true,
//       keyboardType: TextInputType.emailAddress,
//       decoration: InputDecoration(
//         focusColor: Theme.of(context).primaryColor,
//         labelStyle: TextStyle(fontSize: 20),
//         labelText: 'Contraseña',
//         //counterText: snapshot.data,
//         // errorText: snapshot.error.toString()
//       )
//     )
//   );
// }