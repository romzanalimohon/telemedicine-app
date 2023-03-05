import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:telemedecine_app/authentication_page/login.dart';
import 'package:telemedecine_app/components/app_bar.dart';
import 'package:telemedecine_app/components/global_variable.dart';
import 'package:telemedecine_app/ui_model/doctor_list.dart';
import 'package:telemedecine_app/ui_model/profile.dart';
import 'package:telemedecine_app/ui_model/settings.dart';
import 'package:telemedecine_app/ui_model/status.dart';
class HomePage extends StatefulWidget{

  HomePage({Key? key,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  int _currentIndex = 0;
  final tabs = [
    DoctorList(),
    Status(),
    Profile(),
    Settings(),

  ];

  final app_bar = [
    DoctorAppBar(),
    StatusAppBar(),
    ProfileAppBar(),
    SettingsAppBar()
  ];



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: app_bar[_currentIndex],
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          //type: BottomNavigationBarType.fixed,
          //backgroundColor: Colors.white,
          selectedItemColor: Color(0xffAA78E9),
          unselectedItemColor: Colors.orangeAccent,
          selectedFontSize: 16,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_information_outlined),
                label: 'Consultant',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.signal_wifi_statusbar_4_bar),
              label: 'Status',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'profile',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'settings',
            ),
          ],

          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
            },
          //selectedItemColor: Colors.amber[800],
          //selectedIconTheme: ,
        ),
      ),
    );
  }
}
