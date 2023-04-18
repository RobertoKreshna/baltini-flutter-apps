import 'package:baltini_flutter_apps/utils/models/address.dart';
import 'package:baltini_flutter_apps/utils/models/order.dart';
import 'package:baltini_flutter_apps/utils/models/user.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appPath = await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appPath.path);
  Hive.registerAdapter(AddressAdapter());
  Hive.registerAdapter(OrderAdapter());
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');
  await Hive.openBox<Order>('orders');
  runApp(const MyApp());
}
