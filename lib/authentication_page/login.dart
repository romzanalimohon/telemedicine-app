import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:telemedecine_app/authentication_page/register.dart';
import 'package:telemedecine_app/components/nueBox.dart';
import 'package:telemedecine_app/ui_model/home.dart';
import 'package:telemedecine_app/ui_model/profile.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email , password) async {

    try{

      Response response = await post(
          Uri.parse('https://consultant.xprtx.net/public/api/auth/login'),
          body: {
            'email' : email,
            'password' : password
          }
      );

      if(response.statusCode == 200){

        var data = jsonDecode(response.body.toString());
        print(data['Token'].toString());
        print(data['student']['name']);
        print('Login successfully');

      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }
  
  
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
                  height: 80,
                  width: 130,
                  child: NeuBox(child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: new ExactAssetImage('assets/images/trust.jpg'),
                        fit: BoxFit.fill,
                      )
                    ),
                  )),
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!


                const SizedBox(height: 25),

                // username textfield
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'enter email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // password textfield
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      labelText: 'enter password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                GestureDetector(
                  onTap: (){
                    // setState(() {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    // });

                    login(emailController.text.toString(), passwordController.text.toString());
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                    }

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
