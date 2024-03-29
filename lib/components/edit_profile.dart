import 'package:path/path.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:telemedecine_app/components/global_variable.dart';
final userdata = GetStorage();
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {




  TextEditingController addressController = TextEditingController()..text = userdata.read('address');
  TextEditingController cityController = TextEditingController()..text = userdata.read('city').toString();
  TextEditingController countryController = TextEditingController()..text = userdata.read('country').toString();
  TextEditingController stateController = TextEditingController()..text = userdata.read('state').toString();
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
  Future<void> updateData() async {
    int id = userdata.read('id');
    final url = '$api/updatestudent/$id';
    final uri = Uri.parse(url);

    ///to upload image
    var stream = http.ByteStream(image!.openRead());
    stream.cast();
    var length = await image!.length();
    var request = new http.MultipartRequest('POST', uri);
    var multipart = new http.MultipartFile(
        'image', stream, length, filename: basename(image!.path));

    request.fields['address'] = addressController.text;
    request.fields['city'] = cityController.text;
    request.fields['country'] = countryController.text;
    request.fields['state'] = stateController.text;
    request.fields['dob'] = dateController.text;
    request.files.add(multipart);
    print(image);

    print(multipart);

    var response = await request.send();

    if (response.statusCode == 200) {

      image?.delete();
      //request.files.remove(multipart);
      setState(() {
        image = null;
      });
      print('creation success');
      print('uploaded');
    } else {
      print('creation failed');
    }
  }




  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SizedBox(
          height: size.height*1.2,
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
                        controller: addressController,
                        decoration: InputDecoration(
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
                        controller: cityController,
                        decoration: InputDecoration(
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
                        controller: countryController,
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
                        controller: stateController,
                        decoration: InputDecoration(
                            //labelText: ,
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )
              ),



          //     Positioned(
          //       top: 380,
          //       left: 15,
          //       child: GestureDetector(
          //         onTap: (){
          //           setState(() {
          //             getImage();
          //           });
          //         },
          //         child: Container(
          //           color: Colors.green,
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text('Upload Image', style: TextStyle(fontSize: 20, color: Colors.black),),
          //             )),
          //       ),),
          //
          // Positioned(
          //     top: 350,
          //     left: 200,
          //     child: image == null
          //         ? Center(
          //             child: Image.network('https://cdn1.iconfinder.com/data/icons/proffesion/256/Businessman-512.png', height: 100, width: 100,),
          //           )
          //         : Container(
          //             child: Center(
          //               child: (Image.file(
          //                 File(image!.path).absolute,
          //                 height: 100,
          //                 width: 100,
          //                 fit: BoxFit.cover,
          //               )),
          //             ),
          //           )
          //
          //     ),


              Positioned(
                top: 340,
                left: 150,
                child: GestureDetector(
                  onTap: getImage,
                  child: Container(
                    child: image == null ?
                    Center(child: Image.network('https://cdn1.iconfinder.com/data/icons/proffesion/256/Businessman-512.png', height: 100, width: 100,),)
                        : Container(
                      child: Center(
                        child: Image.file(
                          File(image!.path).absolute,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 450,
                left: 140,
                child: Container(
                  child: Center(child: Text('Profile Image', style: TextStyle(fontSize: 20),)),
                ),
              ),


              Positioned(
                top: 520,
                left: 20,
                child: GestureDetector(
                  onTap: updateData,
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
