import 'package:flutter/material.dart';

class PWTextField extends StatelessWidget {
  String hinttext, label, value;
  TextEditingController controller;
  bool isVisible;
  Function onIconTap;

  PWTextField({
    required this.label,
    required this.hinttext,
    required this.controller,
    required this.onIconTap,
    this.isVisible = false,
    this.value = '',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 14),
      obscureText: isVisible ? false : true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 22.0),
        suffixIcon: isVisible
            ? GestureDetector(
                onTap: () {
                  onIconTap();
                },
                child: Icon(Icons.visibility))
            : GestureDetector(
                onTap: () {
                  onIconTap();
                },
                child: Icon(Icons.visibility_off)),
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
