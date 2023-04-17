import 'package:flutter/material.dart';

class NonPWTextField extends StatelessWidget {
  String text;
  TextEditingController controller;

  NonPWTextField({
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 14),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 22.0),
        hintText: text,
        labelText: text,
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
