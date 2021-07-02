import 'package:duo2/src/widgets/campos_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity, height: 15,),
            Campos(),
          ],
        ),
      )
    );
  }
}

