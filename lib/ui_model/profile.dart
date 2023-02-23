import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:telemedecine_app/components/edit_profile.dart';
import 'package:telemedecine_app/components/text_stile.dart';
import 'package:flutter/material.dart' as http;

class Profile extends StatefulWidget {
   // var user;
   // Profile(this.user);
  //const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  List items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodo();
  }



  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              child: Container(
                height: size.height*.3,
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
                                image: new ExactAssetImage('assets/images/rakoon.jpg'),
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
                          Center(child: Text('hghhg', style: TextStyle(fontSize: 32, color: Colors.white))),
                          Center(child: Text('dasdasd@gmail.com', style: linkStyle())),

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
                height: size.height*.44,
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: size.height*.1,
                            width: size.width*.4,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date of Birth', style: TextStyle(fontSize: 20, color: Colors.black),),
                                  Text('88-88-88-88', style: TextStyle(fontSize: 16, color: Colors.black),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: size.height*.1,
                            width: size.width*.4,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Cell Phone', style: TextStyle(fontSize: 20, color: Colors.black),),
                                  Text('88-88-88-88', style: TextStyle(fontSize: 16, color: Colors.black),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),



                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: size.height*.1,
                            width: size.width*.4,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Home Phone', style: TextStyle(fontSize: 20, color: Colors.black),),
                                  Text('88-88-88-88', style: TextStyle(fontSize: 16, color: Colors.black),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: size.height*.1,
                            width: size.width*.4,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date of Birth', style: TextStyle(fontSize: 20, color: Colors.black),),
                                  Text('88-88-88-88', style: TextStyle(fontSize: 16, color: Colors.black),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),


                    SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: (){
                          showModalBottomSheet(context: context, builder: (BuildContext context){
                            return SizedBox(
                              height: 400,
                              child: Container(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: ElevatedButton(
                                          child: Text('X'),
                                          onPressed: (){
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
                            height: size.height*.08,
                            width: size.width*.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.brown,
                            ),
                            child: Center(child: Text("Edit Profile", style: statusStile(),)),
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


  Future<void> fetchTodo() async{

    var response = await get(Uri.parse("https://consultant.xprtx.net/public/api/auth/getstudent/id"));
    final result = json.decode(response.body.toString());

    print(result[0].toString()+' this is fetch todo');

    }


}
