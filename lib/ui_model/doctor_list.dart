import 'package:flutter/material.dart';

class DoctorList extends StatelessWidget {
  const DoctorList({Key? key}) : super(key: key);

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

            Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                    //shrinkWrap: true,
                    itemCount: entries.length,
                    itemBuilder: (context, int index){
                      return Card(
                        margin: EdgeInsets.all(10),
                        child: Container(
                          color: Colors.grey,
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
                                          image: new ExactAssetImage('assets/images/rakoon.jpg'),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                ),
                              ),
                              
                              ///doctors details
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Mohammod'),
                                    Text('Rahman'),
                                    Text('internal'),
                                    Text('ritcare'),
                                    Text('office')
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 100.0),
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
