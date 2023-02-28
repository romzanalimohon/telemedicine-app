import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telemedecine_app/authentication_page/register.dart';
import 'package:telemedecine_app/components/global_variable.dart';
import 'package:telemedecine_app/components/nueBox.dart';
import 'package:telemedecine_app/main.dart';
import 'package:telemedecine_app/ui_model/doctor_list.dart';
import 'package:telemedecine_app/ui_model/home.dart';
import 'package:telemedecine_app/ui_model/profile.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final userdata = GetStorage();

  var data;
  void login(String email , password) async {

    try{

      var response = await post(
          Uri.parse('$api/login'),
          body: {
            'email' : email,
            'password' : password
          }
      );

      var decode = jsonDecode(response.body.toString());
      data = decode;
      print(data['Token'].toString());
      print(data['student']['name']);
      print(data['student']['id']);



      print(data);


      userdata.write('isLogged', true);
      userdata.write('email', data['student']['email']);
      userdata.write('name', data['student']['name']);
      userdata.write('mobile', data['student']['mobile']);
      userdata.write('status', data['student']['status']);

      userdata.write('consultant_name', data['consultant'][0]['name']);
      userdata.write('role', data['consultant'][0]['role']);
      userdata.write('len', data['consultant']);

      userdata.write('status_name', data['statuses'][0]['name']);
      userdata.write('status_description', data['statuses'][0]['description']);
      userdata.write('stat_len', data['statuses']);


      //print(data.student.consultant[0]['name']);
      print(data['consultant'][0]['name']);
      print(data['consultant'].length);


      print(data['statuses'][0]['name']);
      print(data['statuses'].length);


      if(response.statusCode == 200){

        print('login success');


      }else {
        print('failed');
      }
    }catch(e){
      print(e.toString());
    }
  }

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
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
                    child: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        prefixIcon: Icon(Icons.email),
                      ),
                      // validator: (value){
                      //   if(value!.isEmpty){
                      //     return 'enter email';
                      //   }
                      //   final bool emailValid =
                      //   RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      //       .hasMatch(value);
                      //   if(!emailValid){
                      //     return 'enter valid email';
                      //   }
                      // },
                      validator: Validators.compose([
                        Validators.required('email is required'),
                        Validators.email('invalid email address'),
                      ]),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // password textfield
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'password required';
                        }
                      },
                    ),
                  ),

                  const SizedBox(height: 25),

                  GestureDetector(
                    onTap: () async{
                      // setState(() {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                      // });

                      if (_formkey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                            // var sharedPref = await SharedPreferences.getInstance();
                            // sharedPref.setBool(MySplashAppState.KEYLOGIN, false);
                            login(emailController.text.toString(), passwordController.text.toString());
                            //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));

                            Get.offAll(()=> HomePage());
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                        }
                      }





                    },
                    child: Container(
                      height: 50,
                      width: 330,
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
                      width: 330,
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
      ),
    );
  }
}