import 'package:baltini_flutter_apps/views/home/service/home_service.dart';
import 'package:flutter/material.dart';

import '../../../utils/models/product.dart';

class HomeVM extends ChangeNotifier {
  List<Product> products = [];

  setProduct() async {
    var data = await HomeService().getNewArrivalProduct();
    products = data;
    notifyListeners();
  }
}
