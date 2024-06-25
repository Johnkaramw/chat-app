import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomPotton extends StatelessWidget {
  CustomPotton({required this.text ,this.ontap});
  String text;
  VoidCallback? ontap ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 60, 255, 0),
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 50,
        child: Center(
            child: Text(
          text,
          style: TextStyle(fontSize: 25),
        )),
      ),
    );
  }
}
