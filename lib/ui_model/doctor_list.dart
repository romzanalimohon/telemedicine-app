import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
class DoctorList extends StatefulWidget {
  const DoctorList({Key? key}) : super(key: key);

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {

  var data;
  Future getData() async{
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await http.get(uri);
     setState(() {
       var decode = json.decode(response.body);
       data = decode;
       //print(data);
     });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    List<String> entries = <String>['a','b','c','d','a','b','c','d','a','b','c','d',];
    List<int> colorCodes = <int>[600,500,200,300];
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Column(
        children: [
          // Center(child: Padding(
          //   padding: const EdgeInsets.only(top: 8.0),
          //   child: Text('Doctors'),
          // )),

          SizedBox(height: 20,),

            Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                    //shrinkWrap: true,
                    itemCount: data == null? 0 : data.length,
                    itemBuilder: (context, int index){
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.white24, width: 1)
                        ),
                        elevation: 5,
                        margin: EdgeInsets.only(left: 17, right: 17, bottom: 16),
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
                                          image: new NetworkImage(data[index]['url'].toString()),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                ),
                              ),

                              ///doctors details
                              // Padding(
                              //   padding: const EdgeInsets.only(left: 20.0),
                              //   child: Column(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       // Text('Mohammod'),
                              //       // Text('Rahman'),
                              //       // Text('internal'),
                              //       // Text('ritcare'),
                              //       // Text('office')
                              //       Text(data[index]['title'])
                              //     ],
                              //   ),
                              // ),

                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, top: 20),
                                child: SizedBox(
                                  height: 100,
                                  width: 150,
                                  child: Text(data[index]['title'], style: GoogleFonts.lato(
                                    textStyle: TextStyle(fontSize: 16)
                                  ),),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 40.0),
                                child: SizedBox(
                                  height: 70,
                                  width: 70,
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
                            ],
                          ),
                        ),
                      );
                    }),
            ),
        ],
      ),
    );
  }
}
