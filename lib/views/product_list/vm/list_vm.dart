import 'package:baltini_flutter_apps/views/product_list/service/list_service.dart';
import 'package:flutter/material.dart';

import '../../../utils/models/product.dart';

class ListVM extends ChangeNotifier {
  List<Product> products = [];
  String sortBy = 'Featured';

  ListVM(this.products);

  List<String> sortValue = [
    'Best Selling',
    'Featured',
    'Lowest Price',
    'Highest Price',
    'Alphabetically, A-Z',
    'Alphabetically, Z-A',
    'Date, New to Old',
    'Date, Old to New'
  ];

  List<String> filterType = [
    'Gender',
    'Category',
    'Product Type',
    'Designer',
    'Size',
    'Price',
  ];

  List<String> selectedFilter = [];

  setSortValue(String text) async {
    sortBy = text;
    if (text == 'Best Selling' || text == 'Featured') {
      products = await ListService().getProduct();
    } else if (text == 'Lowest Price') {
      products.sort((prod1, prod2) =>
          prod1.price.toString().compareTo(prod2.price.toString()));
    } else if (text == 'Highest Price') {
      products.sort((prod1, prod2) =>
          prod2.price.toString().compareTo(prod1.price.toString()));
    } else if (text == 'Alphabetically, A-Z') {
      products.sort((prod1, prod2) =>
          prod1.title.toString().compareTo(prod2.title.toString()));
    } else if (text == 'Alphabetically, Z-A') {
      products.sort((prod1, prod2) =>
          prod2.title.toString().compareTo(prod1.title.toString()));
    } else if (text == 'Date, New to Old') {
      products.sort((prod1, prod2) =>
          prod1.created.toString().compareTo(prod2.created.toString()));
    } else if (text == 'Date, Old to New') {
      products.sort((prod1, prod2) =>
          prod2.created.toString().compareTo(prod1.created.toString()));
    }
    notifyListeners();
  }
}
