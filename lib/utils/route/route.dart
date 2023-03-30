import 'package:baltini_flutter_apps/views/navbar/bottom_nav.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:flutter/material.dart';

import '../../views/product_list/product_list_page.dart';
import '../models/product.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyNavBar());
      case '/list':
        return MaterialPageRoute(
            builder: (_) => ProductList(settings.arguments as ListVM));

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text("Error")),
        body: Center(child: const Text('Error page')),
      );
    });
  }
}
