import 'package:baltini_flutter_apps/utils/models/user.dart';
import 'package:flutter/material.dart';

class AccountVM extends ChangeNotifier {
  User? currentUser;

  bool userLoggedin = false;

  setAccount(User current, bool value) {
    currentUser = current;
    this.userLoggedin = value;
    notifyListeners();
  }

  logout() {
    currentUser = null;
    userLoggedin = false;
    notifyListeners();
  }
}
