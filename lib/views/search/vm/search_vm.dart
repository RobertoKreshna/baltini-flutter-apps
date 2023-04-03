import 'package:baltini_flutter_apps/utils/models/product.dart';
import 'package:baltini_flutter_apps/views/search/service/search_service.dart';
import 'package:flutter/material.dart';

class SearchVM extends ChangeNotifier {
  var controller = TextEditingController();

  bool showHistory = true;

  List<Product> recommendedItems = [];
  List<String> searchHistory = [];

  searchProduct(String searchValue) async {
    recommendedItems = await SearchService().getProduct(searchValue);
    notifyListeners();
  }

  addToHistory(String history) {
    if (searchHistory.length > 3) {
      searchHistory.removeAt(0);
    }
    searchHistory.add(history);
    notifyListeners();
  }

  toggleHistory(bool value) {
    showHistory = value;
    notifyListeners();
  }
}
