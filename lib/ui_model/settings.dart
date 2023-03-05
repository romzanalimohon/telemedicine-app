import 'package:flutter/material.dart';
import 'package:telemedecine_app/settings/privacy.dart';
import 'package:telemedecine_app/settings/refund_policy.dart';
import 'package:telemedecine_app/settings/support.dart';
import 'package:telemedecine_app/settings/terms.dart';

class Settings extends StatefulWidget {
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  //const Settings({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Support(),
      Terms(),
      PrivacyPolicy(),
      RefundPolicy(),
    ]);
  }
}
