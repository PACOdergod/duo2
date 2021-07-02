import 'package:duo2/src/pages/auth_page.dart';
import 'package:duo2/src/pages/home_page.dart';
import 'package:duo2/src/pages/login_page.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green
        // fontFamily: 
      ),
      title: 'Material App',
      routes: {
        "auth": (_)=> AuthPage(),
        "login": (_)=> LoginPage(),
        "home": (_)=> HomePage()
      },
      initialRoute: "home",
    );
  }
}