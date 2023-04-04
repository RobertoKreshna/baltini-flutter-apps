import 'package:baltini_flutter_apps/views/home/service/home_service.dart';
import 'package:flutter/material.dart';

import '../../../utils/models/product.dart';

class HomeVM extends ChangeNotifier {
  List<Product> Homeproducts = [];

  List<Product>? argsProducts;
  Product? product;

  setProductNewArrival() async {
    var data = await HomeService().getNewArrivalProduct();
    Homeproducts = data;
    notifyListeners();
  }

  setArgs(String how, String value) async {
    if (how == 'brand') {
      argsProducts = await HomeService().getProductByBrand(value);
      notifyListeners();
    } else if (how == 'gender') {
      argsProducts = await HomeService().getProductByGender(value);
      notifyListeners();
    }
  }
}
