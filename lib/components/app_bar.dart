import 'package:flutter/material.dart';
import 'package:telemedecine_app/components/text_stile.dart';

AppBar DoctorAppBar(){
  return AppBar(
    elevation: 1,
    title: Center(child: Text('Consultant', style: appBarStyle())),
    backgroundColor: Colors.white54,
  );
}

AppBar StatusAppBar(){
  return AppBar(
    elevation: 1,
    title: Center(child: Text('Status', style: appBarStyle())),
    backgroundColor: Colors.white54,
  );
}

AppBar ProfileAppBar(){
  return AppBar(
    elevation: 1,
    title: Center(child: Text('Profile', style: appBarStyle())),
    backgroundColor: Colors.white54,
  );
}

AppBar SettingsAppBar(){
  return AppBar(
    elevation: 1,
    title: Center(child: Text('Settings', style: appBarStyle())),
    centerTitle: true,
    backgroundColor: Colors.white54,
    bottom: TabBar(
      labelColor: Colors.deepOrange,
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: TextStyle(
        fontSize: 14
      ),
      labelStyle: TextStyle(
        fontSize: 18
      ),
      tabs: [
        Tab(text: 'Support',),
        Tab(text: 'Terms',),
        Tab(text: 'Privacy',),
        Tab(text: 'Refund\n Policy',)
      ],
    ),
  );
}


