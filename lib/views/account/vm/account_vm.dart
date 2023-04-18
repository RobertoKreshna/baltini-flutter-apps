import 'package:baltini_flutter_apps/utils/hive/boxes.dart';
import 'package:baltini_flutter_apps/utils/models/user.dart';
import 'package:flutter/material.dart';

import '../../../utils/models/order.dart';

class AccountVM extends ChangeNotifier {
  User? currentUser;

  bool userLoggedin = false;

  setAccount(User current, bool value) {
    currentUser = current;
    userLoggedin = value;
    notifyListeners();
  }

  logout() {
    currentUser = null;
    userLoggedin = false;
    notifyListeners();
  }

  updateUser(String firstName, String lastName, String email) {
    String finalFirstName = currentUser!.firstName == firstName
        ? currentUser!.firstName
        : firstName;
    String finalLastName =
        currentUser!.lastName == lastName ? currentUser!.lastName : lastName;
    String finalEmail =
        currentUser!.email == email ? currentUser!.email : email;
    int idx = Boxes.getUserIndex(currentUser!);
    if (idx != -1) {
      Boxes.getUsersBox().putAt(
          idx,
          User(
            firstName: finalFirstName,
            lastName: finalLastName,
            email: finalEmail,
            password: currentUser!.password,
          ));
    }
    setAccount(
        User(
          firstName: finalFirstName,
          lastName: finalLastName,
          email: finalEmail,
          password: currentUser!.password,
        ),
        true);
  }

  updatePassword(String password) {
    int idx = Boxes.getUserIndex(currentUser!);
    if (idx != -1) {
      Boxes.getUsersBox().putAt(
          idx,
          User(
              firstName: currentUser!.firstName,
              lastName: currentUser!.lastName,
              email: currentUser!.email,
              password: password));
    }
    setAccount(
        User(
          firstName: currentUser!.firstName,
          lastName: currentUser!.lastName,
          email: currentUser!.email,
          password: password,
        ),
        true);
  }

  addOrder(Order order) {
    if (currentUser != null) {
      currentUser!.orders.add(order);
      int idx = Boxes.getUserIndex(currentUser!);
      if (idx != -1) {
        Boxes.getUsersBox().putAt(idx, currentUser!);
      }
    }
  }
}
