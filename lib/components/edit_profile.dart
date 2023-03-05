import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:telemedecine_app/components/global_variable.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  final userdata = GetStorage();



  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  File? image;
  final _picker = ImagePicker();

  Future getImage() async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if(pickedFile != null){
      image = File(pickedFile.path);

    }else{
      print('no image selected');
    }
  }



  ///update user profile
  Future<void> updateData() async{

    int id = userdata.read('id');
    print(id);

    final address = addressController.text;
    final city = cityController.text;
    final country = countryController.text;
    final state = stateController.text;
    final date = dateController.text;
    final body = {
      "address": address,
      "city": city,
      "country": country,
      "state": state,
      "dob": date

    };
    //submit updata to the server
    final url = '$api/updatestudent/$id';
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'}
    );
    if(response.statusCode == 200){
      print('updated');
      print(response.body.toString());

    }else{
      print('failed');

    }
  }





  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                top: 10.0,
                left: 15,
                child: Text('Edit Profile', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 17,
                left: 15,
                child: Text('__________________________________________', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),


              ///address
              Positioned(
                top: 45.0,
                left: 15,
                child: Text('Address', style: TextStyle(fontSize: 13, color: Colors.black),),
              ),
              Positioned(
                  top: 65,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: userdata.read('address'),
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),

              Positioned(
                top: 140,
                left: 15,
                child: Text('City', style: TextStyle(fontSize: 13, color: Colors.black),),
              ),

              Positioned(
                  top: 160,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: userdata.read('city'),
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),



              Positioned(
                top: 240,
                left: 15,
                child: Text('Country', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 260,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),

              Positioned(
                top: 235,
                left: 220,
                child: Text('State', style: TextStyle(fontSize: 13, color: Colors.black),),),

              Positioned(
                  top: 260,
                  left: 200,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: userdata.read('state').toString(),
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )
              ),



              Positioned(
                top: 380,
                left: 15,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      getImage();
                    });
                  },
                  child: Container(
                    color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Upload Image', style: TextStyle(fontSize: 20, color: Colors.black),),
                      )),
                ),),

          Positioned(
              top: 350,
              left: 200,
              child: image == null
                  ? Center(
                      child: Image.network('https://cdn1.iconfinder.com/data/icons/proffesion/256/Businessman-512.png', height: 100, width: 100,),
                    )
                  : Container(
                      child: Center(
                        child: (Image.file(
                          File(image!.path).absolute,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )),
                      ),
                    )

              ),

              Positioned(
                top: 520,
                left: 15,
                child: Text('DOB', style: TextStyle(fontSize: 20, color: Colors.black),),),


              Positioned(
                  top: 495,
                  left: 50,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 150, width: 250),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )
              ),
              Positioned(
                top: 600,
                left: 20,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      updateData();
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 370,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text('Save Changes', style: TextStyle(fontSize: 25, color: Colors.white),)),
                  ),
                ),
              ),



            ],
          ),
        )
    );
  }
}
