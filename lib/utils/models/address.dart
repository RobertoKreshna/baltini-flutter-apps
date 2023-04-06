import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 1)
class Address extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String address;

  Address(this.name, this.address);
}
