import 'package:duo2/src/pages/auth_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // fontFamily: 
      ),
      title: 'Material App',
      routes: {
        "auth": (_)=> AuthPage()
      },
      initialRoute: "auth",
    );
  }
}