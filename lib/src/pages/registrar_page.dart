import 'package:flutter/material.dart';

class RegistrarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text("Registrar page"),
      ),
    );
  }
}