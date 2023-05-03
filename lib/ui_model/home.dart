

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:telemedecine_app/authentication_page/login.dart';
import 'package:telemedecine_app/components/app_bar.dart';
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


  final userdata = GetStorage();

  //late Channel _channel;
  String user_name = '';
  //late FlutterLocalNotificationsPlugin localNotification;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();



    //_initPusher();
    // var androidInitialize = new AndroidInitializationSettings('ic_launcher');
    // var initializationSettings = new InitializationSettings(android: androidInitialize);
    // localNotification = new FlutterLocalNotificationsPlugin();
    // localNotification.initialize(initializationSettings);




    userdata.write('isLogged', true);



    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("c939283c-b6eb-4544-abc1-84434531b0e9");

    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });





  }


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
                icon: Icon(Icons.account_box),
                label: 'Consultant',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.signal_wifi_statusbar_4_bar),
              label: 'Status',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
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

  // Future<void> _initPusher() async{
  //   try{
  //     await Pusher.init('fb48880689a60e318188', PusherOptions(cluster: 'ap2'));
  //   }catch(e){
  //     print(e);
  //   }
  //
  //   //connect
  //   Pusher.connect(
  //       onConnectionStateChange: (value){
  //         print(value.currentState);
  //       },
  //       onError: (err){
  //         print(err.message);
  //       }
  //   );
  //
  //   //subscribe
  //   _channel = await Pusher.subscribe('consultant-api');
  //
  //   //bind
  //   _channel.bind('schedule', (onEvent) async{
  //     //print(onEvent.data);
  //     final data = json.decode(onEvent.data);
  //     if(mounted){
  //
  //       setState(() {
  //         //print((data['name']));
  //         print(data);
  //         print(data['student']);
  //
  //
  //         print('student id: '+userdata.read('id').toString());
  //
  //         userdata.write('isLogged', true);
  //
  //
  //         userdata.write('notificationId', data['student']);
  //
  //
  //         user_name = data['message'];
  //
  //         // Get.snackbar(data['name'], data['species']);
  //
  //
  //         if(userdata.read('notificationId').toString() == userdata.read('id').toString()){
  //           var androidDetails = new AndroidNotificationDetails(
  //               "channelId",
  //               "local notification"
  //               "this is description",
  //               importance: Importance.high
  //           );
  //           var generalNotificationDetails = new NotificationDetails(
  //               android: androidDetails
  //           );
  //
  //
  //           localNotification.show(0, data['title'], data['message'], generalNotificationDetails);
  //
  //         }
  //
  //
  //       });
  //     }
  //
  //   });
  //
  // }


  // void checkIfLogged() {
  //   userdata.read('isLogged') ? Get.offAll(()=> HomePage()) : Get.offAll(()=> LoginPage());
  //
  // }

}
