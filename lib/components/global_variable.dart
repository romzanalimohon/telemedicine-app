import 'dart:convert';

import 'package:http/http.dart';

String api = "https://api.ticonsultancy.co.uk/api";

class sample{
  late int userId;
  void login(String email , password) async {

    try{

      Response response = await post(
          Uri.parse('https://consultant.xprtx.net/public/api/auth/login'),
          body: {
            'email' : email,
            'password' : password
          }
      );

      var data = jsonDecode(response.body.toString());
      print(data['Token'].toString());
      print(data['student']['name']);
      print('Login successfully');
      this.userId = data['student']['id'];
      // if(response.statusCode == 200){
      //
      //
      // }else {
      //   print('failed');
      // }
    }catch(e){
      print(e.toString());
    }
  }

}



