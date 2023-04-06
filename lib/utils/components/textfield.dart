import 'package:baltini_flutter_apps/views/login&register/vm/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NonPWTextField extends StatelessWidget {
  String hinttext, label, value;
  TextEditingController controller;

  NonPWTextField({
    required this.label,
    required this.hinttext,
    required this.controller,
    this.value = '',
  });

  @override
  Widget build(BuildContext context) {
    controller.text = value;
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
