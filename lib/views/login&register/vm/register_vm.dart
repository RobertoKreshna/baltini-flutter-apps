import 'package:baltini_flutter_apps/utils/hive/boxes.dart';
import 'package:flutter/material.dart';

import '../../../utils/models/user.dart';

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

  User getUser() {
    return User(firstName.text, lastName.text, email.text, pass.text);
  }

  bool addUsertoDB() {
    User newUser = User(firstName.text, lastName.text, email.text, pass.text);
    var box = Boxes.getUsersBox();
    box.add(newUser);
    return true;
  }
}