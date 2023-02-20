import 'package:flutter/material.dart';
import 'package:telemedecine_app/components/edit_profile.dart';
import 'package:telemedecine_app/components/text_stile.dart';

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

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Romzan Ali Mohon', style: statusStile()),
                          Text('dasdasd@gmail.com', style: linkStyle()),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date of Birth', style: statusStile1(),),
                        Text('88-88-88-88', style: statusStile2(),)
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Cell Phone', style: statusStile1(),),
                        Text('88-88-88-88', style: statusStile2(),)
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Home Phone', style: statusStile1(),),
                        Text('88-88-88-88', style: statusStile2(),)
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Address', style: statusStile1(),),
                        Text('88-88-88-88', style: statusStile2(),)
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),

                Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 20),
                      child: Text('Delete Account', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                    )),


                SizedBox(height: 20,),


                Center(
                  child: Container(
                    height: 48,
                    width: size.width*.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.green
                    ),
                    child: ElevatedButton(

                        child: Text('Edit Profile', style: TextStyle(color: Colors.white, fontSize: 28),),
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
