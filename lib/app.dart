import 'package:baltini_flutter_apps/views/home/vm/home_vm.dart';
import 'package:baltini_flutter_apps/views/product_list/vm/list_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/route/route.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(Object context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeVM>(create: (_) => HomeVM()),
        ChangeNotifierProvider<ListVM>(create: (_) => ListVM([])),
      ],
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
