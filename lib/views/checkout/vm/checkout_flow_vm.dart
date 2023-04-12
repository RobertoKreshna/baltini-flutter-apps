import 'package:baltini_flutter_apps/utils/models/product.dart';
import 'package:flutter/material.dart';

class CheckoutFlowVM extends ChangeNotifier {
  var discountCode = TextEditingController();
  bool discountCodeValidator = false;
  List<Product> checkoutProduct = [];
  List<int> quantity = [];
  List<int> sizeIndex = [];
  bool protect = false;

  setProductQtyProtect(
      List<Product> prod, List<int> qty, List<int> size, bool protectValue) {
    checkoutProduct = prod;
    quantity = qty;
    sizeIndex = size;
    protect = protectValue;
  }

  getTotalPerItem(int index) {
    return double.parse(checkoutProduct[index].price).toInt() * quantity[index];
  }

  toggleValidator(bool value) {
    this.discountCodeValidator = value;
    notifyListeners();
  }
}
