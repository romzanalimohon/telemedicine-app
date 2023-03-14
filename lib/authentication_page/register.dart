import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:telemedecine_app/components/global_variable.dart';
import 'package:telemedecine_app/ui_model/home.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final userdata = GetStorage();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();


  Future<void> submitData() async{
    final name = nameController.text;
    final email = emailController.text;
    final mobile = mobileController.text;


      final body = {
        "name": name,
        "email": email,
        "mobile": mobile,
      };
      //submit data to the server
      final url = '$api/registration';
      final uri = Uri.parse(url);
      final response = await http.post(uri,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'}
      );
      print(response.body);
      if(response.statusCode == 200){
        Get.offAll(HomePage());

        var data = jsonDecode(response.body.toString());
        print('creation success');
        print('uploaded');



        userdata.write('isLogged', true);


        userdata.write('id', data['student']['id']);
        userdata.write('email', data['student']['email']);
        userdata.write('name', data['student']['name']);
        userdata.write('mobile', data['student']['mobile']);
        userdata.write('status', data['student']['status']);

        userdata.write('address', data['studentprofile']['address']);
        userdata.write('city', data['studentprofile']['city']);
        userdata.write('country', data['studentprofile']['country']);
        userdata.write('state', data['studentprofile']['state']);
        userdata.write('image', data['studentprofile']['image']);




        userdata.write('consultant_name', data['consultant'][0]['name']);
        userdata.write('role', data['consultant'][0]['role']);
        userdata.write('len', data['consultant']);

        userdata.write('status_name', data['statuses'][0]['name']);
        userdata.write('status_description', data['statuses'][0]['description']);
        userdata.write('stat_len', data['statuses']);



        ///student profile
        userdata.write('address', data['studentprofile']['address']);
        userdata.write('country', data['studentprofile']['country']);
        userdata.write('city', data['studentprofile']['city']);
        userdata.write('state', data['studentprofile']['state']);


        showSuccessMessage("Registration success");
      }else{
        print('creation failed');
        showErrorMessage("Registration Failed");
        //print(response.body);
      }
      print(response.body);
  }


  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userdata.writeIfNull('isLogged', true);
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
          height: size.height,
          width: size.width,
          child: Form(
            key: _formkey,
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
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                          labelText: '',
                          border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person)
                        //prefixIcon: Icon(Icons.email),
                      ),
                      validator: Validators.compose([
                        Validators.required('name is required'),
                      ]),
                    ),
                  ),
                )),




                Positioned(
                  top: 158,
                  left: 15,
                  child: Text('Email', style: TextStyle(fontSize: 13, color: Colors.black),),),
                Positioned(
                    top: 173,
                    left: 0,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 2),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: '',
                              border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: Validators.compose([
                            Validators.required('email is required'),
                            Validators.email('invalid email address'),
                          ]),
                        ),
                      ),
                    )),

                Positioned(
                  top: 265,
                  left: 15,
                  child: Text('Mobile No', style: TextStyle(fontSize: 13, color: Colors.black),),),
                Positioned(
                    top: 283,
                    left: 0,
                    child: ConstrainedBox(
                      constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 2),
                        child: TextFormField(
                          controller: mobileController,
                          decoration: InputDecoration(
                              labelText: '',
                              border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.phone)
                          ),
                          validator: Validators.compose([
                            Validators.required('valid phone number is required'),
                          ]),

                        ),
                      ),
                    )),


                GestureDetector(
                  onTap: () {
                    if(_formkey.currentState!.validate()){
                      if(nameController.text.isNotEmpty && emailController.text.isNotEmpty
                          && mobileController.text.length >= 9 ){
                        submitData();
                      }
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 400),
                    height: size.height * .07,
                    width: size.width * .9,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ),
        )
      ),
    );
  }


  void showSuccessMessage(String message){
    final snackBar = SnackBar(content: Text(message),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  void showErrorMessage(String message){
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


}
