import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:baltini_flutter_apps/views/home/vm/home_vm.dart';
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
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
