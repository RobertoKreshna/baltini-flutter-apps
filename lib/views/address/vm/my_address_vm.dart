import 'package:baltini_flutter_apps/utils/hive/boxes.dart';
import 'package:baltini_flutter_apps/utils/models/address.dart';
import 'package:baltini_flutter_apps/utils/models/user.dart';
import 'package:flutter/material.dart';

class AddressVM extends ChangeNotifier {
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var company = TextEditingController();
  var address1 = TextEditingController();
  var address2 = TextEditingController();
  var city = TextEditingController();
  var country = TextEditingController();
  var state = TextEditingController();
  var zipcode = TextEditingController();
  var phone = TextEditingController();

  Address? currentAddress;

  bool setdefault = false;

  bool editing = false;

  setEdit(Address address) {
    currentAddress = address;
    firstname.text = address.name;
    company.text = address.company;
    address1.text = address.address;
    city.text = address.city;
    country.text = address.country;
    state.text = address.state;
    zipcode.text = address.zipcode;
    phone.text = address.phone;
  }

  toggleSetDefault() {
    setdefault = !setdefault;
    notifyListeners();
  }

  addAddress(User current) {
    int index = Boxes.getUserIndex(current);
    String name = '${firstname.text} ${lastname.text}';
    String address = '${address1.text} ${address2.text}';
    Address newAddress = Address(name, address, city.text, country.text,
        state.text, zipcode.text, phone.text, company.text);
    current.address.add(newAddress); // add current
    Boxes.getUsersBox().putAt(index, current); //update db
    resetAll();
    notifyListeners();
  }

  deleteAddress(User current, int index) {
    int userIndex = Boxes.getUserIndex(current);
    current.address.removeAt(index); //remove current
    Boxes.getUsersBox().putAt(userIndex, current); //update db
    notifyListeners();
  }

  updateAddress(User current) {
    int userIndex = Boxes.getUserIndex(current);
    String name = '${firstname.text} ${lastname.text}';
    String address = '${address1.text} ${address2.text}';
    Address newAddress = Address(name, address, city.text, country.text,
        state.text, zipcode.text, phone.text, company.text);
    for (int i = 0; i < current.address.length; i++) {
      if (current.address[i] == currentAddress) {
        current.address[i] = newAddress;
      }
    }
    Boxes.getUsersBox().putAt(userIndex, current); //update db
    resetAll();
    notifyListeners();
  }

  void resetAll() {
    firstname.clear();
    lastname.clear();
    company.clear();
    address1.clear();
    address2.clear();
    city.clear();
    country.clear();
    state.clear();
    zipcode.clear();
    phone.clear();
  }
}
