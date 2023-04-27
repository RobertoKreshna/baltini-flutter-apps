import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/address/vm/my_address_vm.dart';
import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:baltini_flutter_apps/views/category/vm/category_vm.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:baltini_flutter_apps/views/forgotpassword/vm/forgot_vm.dart';
import 'package:baltini_flutter_apps/views/home/vm/home_vm.dart';
import 'package:baltini_flutter_apps/views/login&register/vm/login_vm.dart';
import 'package:baltini_flutter_apps/views/login&register/vm/register_vm.dart';
import 'package:baltini_flutter_apps/views/order_detail/vm/order_detail_vm.dart';
import 'package:baltini_flutter_apps/views/product_detail/vm/detail_vm.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:baltini_flutter_apps/views/search/vm/search_vm.dart';
import 'package:baltini_flutter_apps/views/size_chart/vm/size_chart_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/route/route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(Object context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeVM>(create: (_) => HomeVM()),
        ChangeNotifierProvider<ListVM>(create: (_) => ListVM(products: [])),
        ChangeNotifierProvider<DetailVM>(create: (_) => DetailVM()),
        ChangeNotifierProvider<ChartVM>(create: (_) => ChartVM()),
        ChangeNotifierProvider<SearchVM>(create: (_) => SearchVM()),
        ChangeNotifierProvider<CartVM>(create: (_) => CartVM()),
        ChangeNotifierProvider<AccountVM>(create: (_) => AccountVM()),
        ChangeNotifierProvider<LoginVM>(create: (_) => LoginVM()),
        ChangeNotifierProvider<ForgotVM>(create: (_) => ForgotVM()),
        ChangeNotifierProvider<RegisterVM>(create: (_) => RegisterVM()),
        ChangeNotifierProvider<AddressVM>(create: (_) => AddressVM()),
        ChangeNotifierProvider<CategoryVM>(create: (_) => CategoryVM()),
        ChangeNotifierProvider<CheckoutFlowVM>(create: (_) => CheckoutFlowVM()),
        ChangeNotifierProvider<OrderDetailVM>(create: (_) => OrderDetailVM()),
      ],
      child: const MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
