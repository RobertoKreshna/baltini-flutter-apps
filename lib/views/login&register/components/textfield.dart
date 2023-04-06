import 'package:baltini_flutter_apps/views/login&register/vm/login_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginRegisterTextField extends StatelessWidget {
  String hinttext, label;
  TextEditingController controller;
  bool isPassword;

  LoginRegisterTextField(
    this.label,
    this.hinttext,
    this.controller,
    this.isPassword,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVM>(
      builder: (context, value, child) {
        return TextField(
          controller: controller,
          style: TextStyle(fontSize: 14),
          decoration: isPassword
              ? InputDecoration(
                  suffixIcon: value.passVisible
                      ? GestureDetector(
                          onTap: () {
                            value.toggleVisibile();
                          },
                          child: Icon(Icons.visibility))
                      : GestureDetector(
                          onTap: () {
                            value.toggleVisibile();
                          },
                          child: Icon(Icons.visibility_off)),
                  hintText: hinttext,
                  labelText: label,
                  labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                  focusColor: Colors.black,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                )
              : InputDecoration(
                  hintText: hinttext,
                  labelText: label,
                  labelStyle: TextStyle(color: Colors.black, fontSize: 14),
                  focusColor: Colors.black,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                ),
        );
      },
    );
  }
}
