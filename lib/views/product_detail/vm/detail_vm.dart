import 'package:flutter/material.dart';

class DetailVM extends ChangeNotifier {
  int quantity = 1;
  int selectedSizeIndex = 0;
  int imageCurrentIndex = 0;

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
