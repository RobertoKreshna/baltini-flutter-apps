import 'package:flutter/material.dart';

class AccountVM extends ChangeNotifier {
  bool userLoggedin = false;

  setAccount(bool value) {
    this.userLoggedin = value;
    notifyListeners();
  }
}
