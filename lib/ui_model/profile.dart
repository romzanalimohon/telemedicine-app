import 'package:flutter/material.dart';
import 'package:telemedecine_app/components/edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(

      children: [
        //Center(child: Text('Profile')),

        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
            Card(
            margin: EdgeInsets.all(10),
            child: Container(
              height: 120,
              color: Colors.grey,
              child: Row(
                children: [
                  ///image
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      height: 70,
                      width: 70,
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
                    padding: const EdgeInsets.only(left: 5.0, top: 23),
                    child: SizedBox(
                      height: 100,
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Romzan Ali Mohon', style: TextStyle(fontSize: 16),),
                          Text('dasdasd@gmail.com', style: TextStyle(fontSize: 16),),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

                ListTile(
                  title: Text('Date of Birth'),
                  subtitle: Text('88-88-88'),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                ListTile(
                  title: Text('Cell Phone'),
                  subtitle: Text('88-88-88'),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                ListTile(
                  title: Text('Home Phone'),
                  subtitle: Text('88-88-88'),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                ListTile(
                  title: Text('Address'),
                  subtitle: Text('dhaka\nmirpur\nmirpur'),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),

                Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 20),
                      child: Text('Delete Account'),
                    )),


                // Container(
                //   margin: EdgeInsets.all(20),
                //   height: 50,
                //   width: 370,
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //     borderRadius: BorderRadius.circular(50),
                //   ),
                //   child: Center(child: Text('Edit Profile', style: TextStyle(fontSize: 25),)),
                // ),


                Center(
                  child: ElevatedButton(

                      child: Text('edit profile'),
                      onPressed: (){
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
                  ),
                )

              ],
            ),
          ),
        ),
      ],
    );
  }
}
