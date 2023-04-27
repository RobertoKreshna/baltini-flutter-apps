import 'package:flutter/material.dart';

import '../../../utils/models/order.dart';

class OrderDetailVM extends ChangeNotifier {
  Order? current;

  setOrder(Order wanted) {
    current = wanted;
    notifyListeners();
  }

  getTotalperItem(int index) {
    int price = double.parse(current!.products[index].price).toInt();
    int qty = current!.qty[index];
    int total = price * qty;
    return total.toString();
  }
}
