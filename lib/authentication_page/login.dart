import 'package:flutter/material.dart';
import 'package:telemedecine_app/authentication_page/register.dart';
import 'package:telemedecine_app/components/nueBox.dart';
import 'package:telemedecine_app/components/text_field.dart';
import 'package:telemedecine_app/ui_model/doctor_list.dart';
import 'package:telemedecine_app/ui_model/home.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //const SizedBox(height: 10),
                // logo
                SizedBox(
                  height: 100,
                  width: 100,
                  child: NeuBox(child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: new ExactAssetImage('assets/images/rakoon.jpg'),
                        fit: BoxFit.cover,
                      )
                    ),
                  )),
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!


                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  hintText: 'Username',
                  obscureText: false,
                  controller: null,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: null,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                GestureDetector(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('Login', style: TextStyle(fontSize: 25),)),
                  ),
                ),

                const SizedBox(height: 25),

                // or continue with
                GestureDetector(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('Register', style: TextStyle(fontSize: 25, color: Colors.black),)),
                  ),
                ),


                const SizedBox(height: 20),

                // forgot password?
                Center(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),

                const SizedBox(height: 50),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
