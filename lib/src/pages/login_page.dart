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

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _Campos(),
        ],
      )
    );
  }
}

class _Campos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("campos")
    );
  }
}

