import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final child;
  const NeuBox({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: child,),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            blurRadius: 15,
            offset: Offset(5,5)
          ),
          BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-5,-5)
          ),
        ]
      ),
    );
  }
}
