import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:telemedecine_app/components/edit_profile.dart';
import 'package:telemedecine_app/components/text_stile.dart';

import 'package:http/http.dart' as http;



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  // List items = [];
  //
  //
  // var data;
  // Future getStudentProfile(int id) async{
  //   //var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
  //   var uri = Uri.parse("https://consultant.xprtx.net/public/api/auth/getstudent/$id");
  //   var response = await http.get(uri);
  //   setState(() {
  //     var decode = json.decode(response.body);
  //     data = decode;
  //     //print(data);
  //   });
  //   //print(data);
  //   print(data['student']['name']);
  // }



  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final id = widget.user;
  //   getStudentProfile(id);
  // }


  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              child: Container(
                height: size.height * .332,
                width: size.width,
                color: Colors.black,
                child: Column(
                  children: [

                    ///image
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 130,
                        width: 130,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: new ExactAssetImage(
                                    'assets/images/rakoon.jpg'),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ),
                    ),

                    ///doctors details
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(child: Text(userdata.read('name'), style: TextStyle(
                              fontSize: 32, color: Colors.white))),
                          Center(child: Text(
                              userdata.read('email'), style: linkStyle())),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: size.height * .44,
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: size.height * .05,
                        width: size.width * .8,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Cell phone:', style: TextStyle(
                                  fontSize: 20, color: Colors.black),),
                              Text(userdata.read('mobile').toString(), style: TextStyle(
                                  fontSize: 20, color: Colors.black),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: size.height * .05,
                        width: size.width * .8,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Status:', style: TextStyle(
                                  fontSize: 20, color: Colors.black),),
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                child: Text(userdata.read('status').toString(), style: TextStyle(
                                    fontSize: 20, color: Colors.black),),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),




                    SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(context: context,
                              builder: (BuildContext context) {
                                return SizedBox(
                                  height: 400,
                                  child: Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: ElevatedButton(
                                              child: Text('X'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),


                                          EditProfile(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Center(
                          child: Container(
                            height: size.height * .08,
                            width: size.width * .4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.brown,
                            ),
                            child: Center(child: Text(
                              "Edit Profile", style: statusStile(),)),
                          ),
                        ),
                      ),
                    )


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


}
