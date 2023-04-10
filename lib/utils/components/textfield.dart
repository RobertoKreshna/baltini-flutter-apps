import 'package:flutter/material.dart';

class NonPWTextField extends StatelessWidget {
  String hinttext, label;
  TextEditingController controller;

  NonPWTextField({
    required this.label,
    required this.hinttext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        hintText: hinttext,
        labelText: label,
        labelStyle: TextStyle(color: Colors.black, fontSize: 14),
        focusColor: Colors.black,
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
