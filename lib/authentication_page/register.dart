import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:telemedecine_app/components/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password_confirmationController = TextEditingController();

  Future<void> submitData() async{
    final name = nameController.text;
    final email = emailController.text;
    final mobile = mobileController.text;
    final password = passwordController.text;
    final password_confirmation = password_confirmationController.text;

      final body = {
        "name": name,
        "email": email,
        "mobile": mobile,
        "password": password,
        "password_confirmation": password_confirmation
      };
      //submit data to the server
      final url = 'https://consultant.xprtx.net/public/api/auth/registration';
      final uri = Uri.parse(url);
      final response = await http.post(uri,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'}
      );
      if(response.statusCode == 200){
        // usernameController.text = '';
        // passwordController.text = '';
        print('creation success');
        print('uploaded');
      }else{
        print('creation failed');
        //print(response.body);
      }
    print('registration success');
      print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Create an account'),),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height*1.5,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  top: 10.0,
                  left: 15,
                  child: Text('Registration Info', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 17,
                left: 15,
                child: Text('__________________________________________', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 50,
                left: 15,
                child: Text('Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 65,
                  //left: 15,
                  child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 2),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: '',
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
              )),




              Positioned(
                top: 148,
                left: 15,
                child: Text('Email', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 163,
                  left: 0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),








              Positioned(
                top: 238,
                left: 15,
                child: Text('Mobile No', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 253,
                  left: 0,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        controller: mobileController,
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),


              Positioned(
                top: 323,
                left: 15,
                child: Text('password', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 343,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),

              Positioned(
                top: 418,
                left: 15,
                child: Text('confirm_password', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 433,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        controller: password_confirmationController,
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),






              // Positioned(
              //   top: 830,
              //   left: 20,
              //   child: GestureDetector(
              //     onTap: (){
              //       submitData();
              //     },
              //     child: Container(
              //       height: 50,
              //       width: 370,
              //       decoration: BoxDecoration(
              //       color: Colors.blue,
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     child: Center(child: Text('Register', style: TextStyle(fontSize: 25, color: Colors.black),)),
              // ),
              //   ),)

              Positioned(
                top: 500,
                left: 20,
                child: ElevatedButton(
                  child: Text('register'),
                  onPressed: submitData,
                ),
              )


              // Column(
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(left: 15.0, top: 10),
              //       child: Text('About you', style: TextStyle(fontSize: 20, color: Colors.black),),
              //     ),
              //     const Divider(
              //       height: 10,
              //       thickness: 2,
              //       indent: 20,
              //       endIndent: 10,
              //       color: Colors.black,
              //     ),
              //   ],
              // ),
              //
              // Positioned(
              //   top: 50,
              //   child: Text('First Name', style: TextStyle(fontSize: 13, color: Colors.black),),)
            ],
          ),
        )
      ),
    );
  }
}
