import 'package:flutter/material.dart';

import '../../../utils/models/product.dart';

class DetailVM extends ChangeNotifier {
  Product? current;
  int quantity = 1;
  int selectedSizeIndex = 0;
  int imageCurrentIndex = 0;

  setProduct(Product wanted) {
    current = wanted;
    notifyListeners();
  }

  disposeProduct() {
    current = null;
    notifyListeners();
  }

  imageChanged(int index) {
    imageCurrentIndex = index;
    notifyListeners();
  }

  setSelectedSize(int index) {
    selectedSizeIndex = index;
    notifyListeners();
  }

  decreaseQty() {
    if (quantity > 1) {
      quantity -= 1;
    }
    notifyListeners();
  }

  incereaseQty() {
    quantity += 1;
    notifyListeners();
  }
}
