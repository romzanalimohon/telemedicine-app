
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:telemedecine_app/components/text_stile.dart';

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  
  final userdata = GetStorage();
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'USA Student Visa Steps',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                //shrinkWrap: true,
                itemCount: userdata.read('stat_len').length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                        margin: EdgeInsets.only(left: 5, right: 5),
                        color: i%2 == 0? Colors.black12 : Colors.white10,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Step',
                              style: statusStile1(),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                color: i%2 == 0? Colors.white : Colors.black12,),
                              child: Center(
                                  child: Text(
                                (i+1).toString(),
                                style: statusStile1(),
                              )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 10,
                              endIndent: 40,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              // height: 270,
                              // width: size.width * .62,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userdata.read('status_name').toString(),
                                    style: statusStile1(),
                                  ),
                                  Text(
                                    (userdata.read('status_description') == null)? '' : userdata.read('status_description').toString(),
                                    style: statusStile2(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
