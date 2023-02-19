import 'package:flutter/material.dart';
import 'package:telemedecine_app/components/text_stile.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List number = [1,2,3,4,5,6,7,8];
    return Column(
      children: [
        SizedBox(height: 5,),
        Text('USA Student Visa Steps', style: statusStile(),),
        SizedBox(height: 5,),
        Container(
          color: Colors.brown,
          height: 100,
          child: Row(
            children: [
              SizedBox(width: 10,),
              Text('Step', style: statusStile1(),),
              SizedBox(width: 5,),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.red
                ),
                child: Center(child: Text(number[0].toString(), style: statusStile1(),)),
              ),
              SizedBox(width: 10,),

              const VerticalDivider(
                width: 20,
                thickness: 1,
                indent: 30,
                endIndent: 30,
                color: Colors.black45,
              ),
              SizedBox(width: 5,),
              Text('Document Submission', style: statusStile1(),)
            ],
          ),
        )
      ],
    );
  }
}
