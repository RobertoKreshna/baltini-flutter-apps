import 'package:flutter/material.dart';

class RegisterVM extends ChangeNotifier {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();

  bool passVisible = false;

  toggleVisibile() {
    passVisible = !passVisible;
    notifyListeners();
  }
}
