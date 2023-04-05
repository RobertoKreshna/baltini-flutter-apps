import 'package:baltini_flutter_apps/views/cart/cart_page.dart';
import 'package:baltini_flutter_apps/views/navbar/bottom_nav.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:baltini_flutter_apps/views/size_chart/size_chart_page.dart';
import 'package:baltini_flutter_apps/views/utils/ask_question_page.dart';
import 'package:baltini_flutter_apps/views/utils/authenticity_page.dart';
import 'package:baltini_flutter_apps/views/utils/ship_return_page.dart';
import 'package:flutter/material.dart';

import '../../views/product_detail/product_detail_page.dart';
import '../../views/product_list/product_list_page.dart';
import '../../views/search/search_page.dart';
import '../models/product.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MyNavBar());
      case '/list':
        return MaterialPageRoute(builder: (_) => ProductListPage());
      case '/details':
        return MaterialPageRoute(
            builder: (_) => ProductDetailPage(settings.arguments as Product));
      case '/chart':
        return MaterialPageRoute(builder: (_) => SizeChartPage());
      case '/search':
        return MaterialPageRoute(builder: (_) => SearchPage());
      case '/cart':
        return MaterialPageRoute(builder: (_) => CartPage());
      case '/shipreturn':
        return MaterialPageRoute(builder: (_) => ShipReturn());
      case '/authentic':
        return MaterialPageRoute(builder: (_) => Authenticity());
      case '/askquestion':
        return MaterialPageRoute(builder: (_) => AskQuestion());
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
