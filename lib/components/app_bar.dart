import 'package:flutter/material.dart';

AppBar DoctorAppBar(){
  return AppBar(
    title: Center(child: Text('Doctor', style: TextStyle(color: Colors.black))),
    backgroundColor: Colors.white54,
  );
}

AppBar ProfileAppBar(){
  return AppBar(
    title: Center(child: Text('Profile', style: TextStyle(color: Colors.black))),
    backgroundColor: Colors.white54,
  );
}

AppBar SettingsAppBar(){
  return AppBar(
    title: Center(child: Text('Settings', style: TextStyle(color: Colors.black),)),
    centerTitle: true,
    backgroundColor: Colors.white54,
    bottom: TabBar(
      labelColor: Colors.black,
      tabs: [
        Tab(text: 'Support',),
        Tab(text: 'Terms',),
        Tab(text: 'Privacy',),
      ],
    ),
  );
}
