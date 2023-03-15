import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:telemedecine_app/components/global_variable.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  final userdata = GetStorage();


  Future<void> changePassword(int id) async{
    final oldPassword = oldPasswordController.text;
    final newPassword = newPasswordController.text;
    final body = {
      "old_password": oldPassword,
      "new_password": newPassword,
    };
    //submit data to the server
    final url = '$api/password/update/$id';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'}
    );
    print(response.statusCode);
    if(response.statusCode == 200){
      oldPasswordController.text = '';
      newPasswordController.text = '';
      print('password changed');
    }else{
      print('update failed');
      //print(response.body);
    }

  }




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///address
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Change Password', style: TextStyle(fontSize: 20, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('__________________________________________', style: TextStyle(fontSize: 20, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15),
              child: Text('Old Password', style: TextStyle(fontSize: 13, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
              child: TextFormField(
                controller: oldPasswordController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                //controller: passwordController,
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

            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15),
              child: Text('New Password', style: TextStyle(fontSize: 13, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
              child: TextFormField(
                controller: newPasswordController,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                //controller: passwordController,
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

            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(

                  onTap: (){
                    setState(() {
                      changePassword(userdata.read('id'));
                    });
                  },

                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text('Save Changes', style: TextStyle(fontSize: 25, color: Colors.white),)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
