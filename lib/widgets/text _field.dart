// ignore_for_file: must_be_immutable, body_might_complete_normally_nullable

import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({this.hintText, this.onChanged});
  String? hintText;
  Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) return 'error found';
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText, // تم تصحيح الاسم هنا
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 21, 255, 0),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
      ),
    );
  }
}
