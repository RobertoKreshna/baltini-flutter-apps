import 'package:flutter/material.dart';

import '../../../utils/models/order.dart';

class OrderDetailVM extends ChangeNotifier {
  Order? current;

  setOrder(Order wanted) {
    current = wanted;
    notifyListeners();
  }
}
