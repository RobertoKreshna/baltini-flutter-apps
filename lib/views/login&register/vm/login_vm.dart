import 'package:baltini_flutter_apps/utils/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/hive/boxes.dart';
import '../../account/vm/account_vm.dart';

class LoginVM extends ChangeNotifier {
  var email = TextEditingController();
  var pass = TextEditingController();

  bool passVisible = false;

  toggleVisibile() {
    passVisible = !passVisible;
    notifyListeners();
  }

  clearAll() {
    email.clear();
    pass.clear();
  }

  User? getUser() {
    User? wantedUser;
    final box = Boxes.getUsersBox();
    Map users = box.toMap();
    for (User user in users.values) {
      if (user.email == this.email.text) {
        wantedUser = user;
      }
    }
    return wantedUser;
  }

  bool checkLogin() {
    bool res = false;
    final box = Boxes.getUsersBox();
    Map users = box.toMap();
    for (User user in users.values) {
      if (user.email == email.text && user.password == pass.text) {
        res = true;
        break;
      }
    }
    return res;
  }
}
