import 'package:flutter/material.dart';

import '../../../utils/models/product.dart';

class CartVM extends ChangeNotifier {
  Map<Product, int> products = {};

  addProduct(Product currentProduct, int currentQuantity) {
    products[currentProduct] = currentQuantity;
    notifyListeners();
  }

  deleteProduct(Product currentProduct) {
    products.remove(currentProduct);
    notifyListeners();
  }
}
