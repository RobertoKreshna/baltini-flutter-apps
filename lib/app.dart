import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:baltini_flutter_apps/views/forgotpassword/vm/forgot_vm.dart';
import 'package:baltini_flutter_apps/views/home/vm/home_vm.dart';
import 'package:baltini_flutter_apps/views/login&register/vm/login_vm.dart';
import 'package:baltini_flutter_apps/views/login&register/vm/register_vm.dart';
import 'package:baltini_flutter_apps/views/product_detail/vm/detail_vm.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:baltini_flutter_apps/views/search/vm/search_vm.dart';
import 'package:baltini_flutter_apps/views/size_chart/vm/size_chart_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/route/route.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(Object context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeVM>(create: (_) => HomeVM()),
        ChangeNotifierProvider<ListVM>(create: (_) => ListVM(products: [])),
        ChangeNotifierProvider<DetailVM>(
          create: (_) => DetailVM(),
        ),
        ChangeNotifierProvider<ChartVM>(create: (_) => ChartVM()),
        ChangeNotifierProvider<SearchVM>(create: (_) => SearchVM()),
        ChangeNotifierProvider<CartVM>(create: (_) => CartVM()),
        ChangeNotifierProvider<AccountVM>(create: (_) => AccountVM()),
        ChangeNotifierProvider<LoginVM>(create: (_) => LoginVM()),
        ChangeNotifierProvider<ForgotVM>(create: (_) => ForgotVM()),
        ChangeNotifierProvider<RegisterVM>(create: (_) => RegisterVM()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
