import 'package:flutter/material.dart';

import '../../../utils/models/product.dart';

class CartVM extends ChangeNotifier {
  var notes = TextEditingController();

  double totalPrice = 0;
  bool agreeTC = false;
  bool valueClickProtect = false;
  List<Product> products = [];
  List<int> sizeIndex = [];
  List<int> qty = [];

  addProduct(Product currentProduct, int currentQuantity, int selectedSize) {
    products.add(currentProduct);
    sizeIndex.add(selectedSize);
    qty.add(currentQuantity);
    double price = double.parse(currentProduct.price);
    totalPrice += price;
    notifyListeners();
  }

  deleteProduct(Product currentProduct) {
    int index = products.indexOf(currentProduct);
    products.removeAt(index);
    sizeIndex.removeAt(index);
    qty.removeAt(index);
    double price = double.parse(currentProduct.price);
    totalPrice -= price;
    notifyListeners();
  }

  addQty(int index) {
    qty[index] += 1;
    notifyListeners();
  }

  minQty(int index) {
    if (qty[index] > 1) {
      qty[index] -= 1;
    }
    notifyListeners();
  }

  toggleClickProtect() {
    valueClickProtect = !valueClickProtect;
    notifyListeners();
  }

  toggleTC() {
    agreeTC = !agreeTC;
    notifyListeners();
  }
}
