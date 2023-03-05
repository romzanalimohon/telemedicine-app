import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
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
            child: TextField(
              decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder()
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15),
            child: Text('Confirm Password', style: TextStyle(fontSize: 13, color: Colors.black),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
            child: TextField(
              decoration: InputDecoration(
                  labelText: '',
                  border: OutlineInputBorder()
              ),
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
    );
  }
}
