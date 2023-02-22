import 'package:flutter/material.dart';
import 'package:telemedecine_app/authentication_page/login.dart';
import 'package:telemedecine_app/authentication_page/register.dart';
import 'package:telemedecine_app/ui_model/home.dart';
import 'package:telemedecine_app/ui_model/profiledemo.dart';
import 'package:telemedecine_app/ui_model/status.dart';

import '../utils/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: LoginPage(),
      //home: ProfileDemoPage(),
      //home: HomePage(),
      // home: RegisterPage(),
      //home: Status(),

      initialRoute: MyRoutes.LoginRoute,
      routes: {
        // MyRoutes.ProfileRoute: (context) => ProfileDemoPage(),
        MyRoutes.ConsultantRoute: (context) => HomePage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.RegisterRoute: (context) => RegisterPage(),
      },
    );
  }
}
