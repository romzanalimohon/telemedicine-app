import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:telemedecine_app/components/change_password.dart';
import 'package:telemedecine_app/components/edit_profile.dart';
import 'package:telemedecine_app/components/text_stile.dart';

import 'package:http/http.dart' as http;



class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


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
              //margin: EdgeInsets.all(10),
              child: Container(
                height: size.height * .332,
                width: size.width * .95,
                color: Colors.brown,
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
                                image: new NetworkImage('https://cdn1.iconfinder.com/data/icons/proffesion/256/Businessman-512.png'),
                                //image: NetworkImage(userdata.read('image').toString()),
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
                          Center(child: Text(userdata.read('name').toString(), style: TextStyle(
                              fontSize: 32, color: Colors.white))),
                          Center(child: Text(
                              userdata.read('email').toString(), style: linkStyle())),

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
                width: size.width * .95,
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
                             isScrollControlled: true,
                             builder: (BuildContext context) {
                                return FractionallySizedBox(
                                  heightFactor: .9,
                                  child: SizedBox(
                                    height: 400,
                                    child: Container(
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                                child: InkWell(
                                                  onTap: (){
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(top: 10, bottom: 15),
                                                    child: CircleAvatar(
                                                        backgroundColor: Colors.red,
                                                        child: Text('X', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
                                                  ),
                                                )
                                            ),


                                            EditProfile(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },);
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
                    ),

                    GestureDetector(


                      onTap: () {
                        showModalBottomSheet(context: context,
                            isScrollControlled: true,
                            builder: (BuildContext context) {
                              return FractionallySizedBox(
                                heightFactor: .8,
                                child: SizedBox(
                                  height: 400,
                                  child: Container(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(top: 10, bottom: 15),
                                                child: CircleAvatar(
                                                    backgroundColor: Colors.red,
                                                    child: Text('X', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),)),
                                              ),
                                            )
                                          ),


                                          ChangePassword(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                      },


                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Text('Change Password', style: TextStyle(color: Colors.white),),
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
