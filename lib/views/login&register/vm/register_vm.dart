import 'package:baltini_flutter_apps/utils/hive/boxes.dart';
import 'package:flutter/material.dart';

import '../../../utils/models/user.dart';

class RegisterVM extends ChangeNotifier {
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();

  bool passVisible = false;

  User? currentUser;

  toggleVisibile() {
    passVisible = !passVisible;
    notifyListeners();
  }

  bool addUsertoDB() {
    User newUser = User(
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      password: pass.text,
    );
    currentUser = newUser;
    var box = Boxes.getUsersBox();
    box.add(newUser);
    return true;
  }

  clearAll() {
    firstName.clear();
    lastName.clear();
    email.clear();
    pass.clear();
  }
}
