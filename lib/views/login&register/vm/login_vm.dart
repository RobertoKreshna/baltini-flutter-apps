import 'package:flutter/material.dart';

class LoginVM extends ChangeNotifier {
  var email = TextEditingController();
  var pass = TextEditingController();

  bool passVisible = false;

  toggleVisibile() {
    passVisible = !passVisible;
    notifyListeners();
  }
}
