
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:telemedecine_app/authentication_page/login.dart';
import 'package:telemedecine_app/components/text_stile.dart';

class Support extends StatefulWidget {
  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  //const Support({Key? key}) : super(key: key);
  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Center(child: Text('Profile')),

        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5,),
                      Text('Bangladesh', style: statusStile1(),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 7,),
                          Flexible(child: Text('House No-6 (5th Floor), Road, 2/B Baridhara J Block, Dhaka 1212', style: TextStyle(fontSize: 16),)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 7,),
                          Flexible(child: Text('+880 1778-321841', style: TextStyle(fontSize: 16))),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(width: 7,),
                          Flexible(child: Text('admission@ticonsultancy.co.uk', style: TextStyle(fontSize: 16))),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined),
                          SizedBox(width: 7,),
                          Flexible(child: Text('Saturday – Thursday: 10.00 AM – 6.30 PM', style: TextStyle(fontSize: 16))),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.arrow_forward),
                          SizedBox(width: 7,),
                          Flexible(child: Text('Bangladesh Local Branches', style: TextStyle(fontSize: 16))),
                        ],
                      ),

                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),

                Container(
                  margin: EdgeInsets.all(11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('UK Office', style: statusStile1(),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 7,),
                          Flexible(child: Text('14 Valance Road, London E1 5HR, 1st Floor, UK', style: TextStyle(fontSize: 16),)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(width: 7,),
                          Flexible(child: Text('admission@ticonsultancy.co.uk', style: TextStyle(fontSize: 16))),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined),
                          SizedBox(width: 7,),
                          Flexible(child: Text('Saturday – Thursday: 10.00 AM – 6.30 PM', style: TextStyle(fontSize: 16))),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.arrow_forward),
                          SizedBox(width: 7,),
                          Flexible(child: Text('UK Office Local Branches', style: TextStyle(fontSize: 16))),
                        ],
                      ),

                    ],
                  ),
                ),

                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),


                Container(
                  margin: EdgeInsets.all(11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('USA Office', style: statusStile1(),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 5,),
                          Flexible(child: Text('167-16 St, Jamaica New York, 11432, USA', style: TextStyle(fontSize: 16),)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(width: 7,),
                          Flexible(child: Text('+1(929)4998831', style: TextStyle(fontSize: 16))),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.email),
                          SizedBox(width: 7,),
                          Flexible(child: Text('admission@ticonsultancy.co.uk', style: TextStyle(fontSize: 16))),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.access_time_outlined),
                          SizedBox(width: 7,),
                          Flexible(child: Text('Saturday – Thursday: 10.00 AM – 6.30 PM', style: TextStyle(fontSize: 16))),
                        ],
                      ),

                      Row(
                        children: [
                          Icon(Icons.arrow_forward),
                          SizedBox(width: 7,),
                          Flexible(child: Text('USA Office Local Branches', style: TextStyle(fontSize: 16))),
                        ],
                      ),

                    ],
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    userdata.write('isLogged', false);
                    userdata.remove('name');
                    userdata.remove('email');
                    Get.offAll(LoginPage());
                    showLogOutMessage('you have logged out');
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    height: 50,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void showLogOutMessage(String message){
    final snackBar = SnackBar(content: Text(message),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
