import 'package:flutter/material.dart';
import 'package:telemedecine_app/authentication_page/login.dart';
import 'package:telemedecine_app/authentication_page/register.dart';
import 'package:telemedecine_app/ui_model/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      //home: HomePage(),
      //home: RegisterPage(),
    );
  }
}
