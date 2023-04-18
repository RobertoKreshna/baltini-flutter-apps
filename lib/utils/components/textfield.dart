import 'package:flutter/material.dart';

class NonPWTextField extends StatelessWidget {
  String text;
  TextEditingController controller;

  NonPWTextField({
    super.key,
    required this.text,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(fontSize: 14),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 22.0),
        hintText: text,
        labelText: text,
        labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
        focusColor: Colors.black,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
      ),
    );
  }
}
