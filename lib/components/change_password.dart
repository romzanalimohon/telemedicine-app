import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

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
              child: Text('New Password', style: TextStyle(fontSize: 13, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
              child: TextFormField(
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
              child: Text('Confirm Password', style: TextStyle(fontSize: 13, color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
              child: TextFormField(
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
          ],
        ),
      ),
    );
  }
}
