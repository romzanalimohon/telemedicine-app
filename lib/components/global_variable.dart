import 'dart:convert';

import 'package:http/http.dart';

int userId = 2;
//String api = "https://consultant.xprtx.net/public/api/auth";
String api = "https://api.ticonsultancy.co.uk/api";

void login(String email , password) async {

  try{

    Response response = await post(
        Uri.parse('$api/login'),
        body: {
          'email' : email,
          'password' : password
        }
    );

    if(response.statusCode == 200){

      var data = jsonDecode(response.body.toString());
      print(data['Token'].toString());
      print(data['student']['name']);
      print(data['student']['id']);
      userId = data['student']['id'];
      print("user id: $userId");
      print('Login successfully');
      //showSuccessMessage("Login Successfully");

    }else {
      print('failed');
      //showErrorMessage("Login Failed");
    }
  }catch(e){
    print(e.toString());
  }
}

