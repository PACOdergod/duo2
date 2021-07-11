import 'package:duo2/src/controllers/advance_controller.dart';
import 'package:duo2/src/pages/auth_page.dart';
import 'package:duo2/src/pages/home_page.dart';
import 'package:duo2/src/pages/lesson_page.dart';
import 'package:duo2/src/pages/login_page.dart';
import 'package:duo2/src/pages/registrar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Get.put( AdvanceController() );
    
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green
        // fontFamily: 
      ),
      title: 'Material App',
      routes: {
        "auth": (_)=> AuthPage(),
        "login": (_)=> LoginPage(),
        "home": (_)=> HomePage(),
        "lesson": (_)=> LessonPage(),
        "registrar":(_)=> RegistrarPage()
      },
      initialRoute: "login",
    );
  }
}