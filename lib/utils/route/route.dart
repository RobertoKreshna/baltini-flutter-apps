import 'package:baltini_flutter_apps/views/account/change_password_page.dart';
import 'package:baltini_flutter_apps/views/account/my_profile_page.dart';
import 'package:baltini_flutter_apps/views/address/address_form_page.dart';
import 'package:baltini_flutter_apps/views/address/my_address_page.dart';
import 'package:baltini_flutter_apps/views/category/specific_category_page.dart';
import 'package:baltini_flutter_apps/views/forgotpassword/forgot_password_page.dart';
import 'package:baltini_flutter_apps/views/login&register/login_page.dart';
import 'package:baltini_flutter_apps/views/login&register/register_page.dart';
import 'package:baltini_flutter_apps/views/cart/cart_page.dart';
import 'package:baltini_flutter_apps/views/navbar/bottom_nav.dart';
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
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case '/forgotpassword':
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => MyProfilePage());
      case '/changepw':
        return MaterialPageRoute(builder: (_) => ChangePasswordPage());
      case '/address':
        return MaterialPageRoute(builder: (_) => MyAddressPage());
      case '/formaddress':
        return MaterialPageRoute(builder: (_) => AddressFormPage());
      case '/specificcategory':
        return MaterialPageRoute(builder: (_) => SpecificCategoryPage());
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
