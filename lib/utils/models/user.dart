import 'package:baltini_flutter_apps/utils/models/address.dart';
import 'package:baltini_flutter_apps/utils/models/order.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;
  @HiveField(2)
  String email;
  @HiveField(3)
  String password;
  @HiveField(4)
  List<Address> address;
  @HiveField(5)
  List<Order> orders;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    this.address = const [],
    this.orders = const [],
  });
}
