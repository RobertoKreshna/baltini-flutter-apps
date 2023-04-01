import 'package:flutter/material.dart';

class SearchVM extends ChangeNotifier {
  var controller = TextEditingController();

  bool showHistory = true;

  List<String> searchHistory = [];

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
