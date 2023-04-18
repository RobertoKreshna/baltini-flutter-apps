import 'package:flutter/material.dart';

class PWTextField extends StatelessWidget {
  String hinttext, label, value;
  TextEditingController controller;
  bool isVisible;
  Function onIconTap;

  PWTextField({
    super.key,
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
      style: const TextStyle(fontSize: 14),
      obscureText: isVisible ? false : true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 22.0),
        suffixIcon: isVisible
            ? GestureDetector(
                onTap: () {
                  onIconTap();
                },
                child: const Icon(Icons.visibility))
            : GestureDetector(
                onTap: () {
                  onIconTap();
                },
                child: const Icon(Icons.visibility_off)),
        hintText: hinttext,
        labelText: label,
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
