import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
class DoctorList extends StatefulWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {

  final userdata = GetStorage();

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Column(
        children: [

          SizedBox(height: 20,),

            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    //shrinkWrap: true,
                    //itemCount: data == null? 0 : data.length,
                    itemCount: 1,
                    itemBuilder: (context, int index){
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: Colors.white24, width: 1)
                        ),
                        elevation: 5,
                        margin: EdgeInsets.only(left: 5, right: 5, bottom: 16),
                        child: Container(
                          //color: Colors.white60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: Row(
                            children: [
                              ///image
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        image: DecorationImage(
                                          image: NetworkImage('https://cdn1.iconfinder.com/data/icons/proffesion/256/Businessman-512.png'),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                ),
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: Text(userdata.read('consultant_name').toString(), style: GoogleFonts.lato(
                                      textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                    ),),
                                  ),

                                  SizedBox(
                                    child: Text('Role: '+userdata.read('role').toString(), style: GoogleFonts.lato(
                                        textStyle: TextStyle(fontSize: 16)
                                    ),),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: GestureDetector(
                                    onTap: (){
                                      //Navigator.push(context, MaterialPageRoute(builder: (context)=> IndexPage()));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          image: DecorationImage(
                                            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQO1YnvQ15XyjnY_qeHNdRIJR1eE8RC1IMxpwc_0P73_69W5TWxVUXej9NE7KkFwsSZ9c&usqp=CAU'),
                                            fit: BoxFit.cover,
                                          )
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
            ),
        ],
      ),
    );
  }
}
