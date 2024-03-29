import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedecine_app/authentication_page/login.dart';
import 'package:telemedecine_app/ui_model/home.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: MySplashApp(),
    )
  );
}

class MySplashApp extends StatefulWidget {
  const MySplashApp({Key? key}) : super(key: key);

  @override
  State<MySplashApp> createState() => MySplashAppState();
}

class MySplashAppState extends State<MySplashApp> {

  final userdata = GetStorage();


  static const String KEYLOGIN = 'login';



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //whereToGo();

    userdata.writeIfNull('isLogged', false);
    Future.delayed(Duration.zero, () async{
      checkIfLogged();
    });








  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //home: LoginPage(),
      //home: ProfileDemoPage(),
      //home: HomePage(),
      // home: RegisterPage(),
      //home: Status(),

      // initialRoute: MyRoutes.LoginRoute,
      // routes: {
      //   // MyRoutes.ProfileRoute: (context) => ProfileDemoPage(),
      //   MyRoutes.ConsultantRoute: (context) => HomePage(),
      //   MyRoutes.LoginRoute: (context) => LoginPage(),
      //   MyRoutes.RegisterRoute: (context) => RegisterPage(),
      // },

      body: Container(
        color: Colors.brown,
        child: Center(
          child: Text('Consultancy App', style: GoogleFonts.anton(
            fontSize: 50, color: Colors.white
          ),),
        ),
      ),
    );
  }


  // void whereToGo() async{
  //   var sharedPref = await SharedPreferences.getInstance();
  //   var isLoggedIn = sharedPref.getBool(KEYLOGIN);
  //
  //   Timer(Duration(seconds: 2), () {
  //     if(isLoggedIn == null){
  //       if(isLoggedIn != null){
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
  //       }else{
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
  //       }
  //     }else{
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
  //     }
  //   });
  // }

  void checkIfLogged() {
    userdata.read('isLogged') ? Get.offAll(()=>HomePage()) : Get.offAll(()=> LoginPage());


  }






}
