import 'package:flutter/material.dart';
import 'package:telemedecine_app/components/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                  child: Text('About you', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 17,
                left: 15,
                child: Text('__________________________________________', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 50,
                left: 15,
                child: Text('First Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 70,
                  //left: 15,
                  child: ConstrainedBox(
                constraints: BoxConstraints.expand(height: 200, width: 200),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 2),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: '',
                        border: OutlineInputBorder()
                    ),
                  ),
                ),
              )),




              Positioned(
                top: 50,
                left: 214,
                child: Text('Last Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 70,
                  left: 200,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),




              Positioned(
                top: 150,
                left: 15,
                child: Text('First Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 165,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),




              Positioned(
                top: 150,
                left: 214,
                child: Text('Last Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 165,
                  left: 200,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),




              ///for contact
              Positioned(
                top: 250.0,
                left: 15,
                child: Text('Contact', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 257,
                left: 15,
                child: Text('_____________________________________________________', style: TextStyle(fontSize: 16, color: Colors.black),),
              ),
              Positioned(
                top: 300,
                left: 15,
                child: Text('First Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 320,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),




              Positioned(
                top: 300,
                left: 214,
                child: Text('Last Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 320,
                  left: 200,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),



              ///address
              Positioned(
                top: 400.0,
                left: 15,
                child: Text('Address', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 405,
                left: 15,
                child: Text('__________________________________________', style: TextStyle(fontSize: 20, color: Colors.black),),
              ),
              Positioned(
                top: 435,
                left: 15,
                child: Text('Address Line 1', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 450,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),

              Positioned(
                top: 530,
                left: 15,
                child: Text('Address Line 1', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 544,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: size.width*.95),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),



              Positioned(
                top: 620,
                left: 15,
                child: Text('First Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 635,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),




              Positioned(
                top: 620,
                left: 214,
                child: Text('Last Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 635,
                  left: 200,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),



              Positioned(
                top: 720,
                left: 15,
                child: Text('First Name', style: TextStyle(fontSize: 13, color: Colors.black),),),
              Positioned(
                  top: 735,
                  //left: 15,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(height: 200, width: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: TextField(
                        decoration: InputDecoration(
                            labelText: '',
                            border: OutlineInputBorder()
                        ),
                      ),
                    ),
                  )),


              Positioned(
                top: 830,
                left: 20,
                child: Container(
                  height: 50,
                  width: 370,
                  decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Register', style: TextStyle(fontSize: 25, color: Colors.black),)),
              ),)


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
