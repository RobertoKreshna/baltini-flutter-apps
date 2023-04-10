import 'package:hive/hive.dart';

part 'address.g.dart';

@HiveType(typeId: 1)
class Address extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String address;
  @HiveField(2)
  String city;
  @HiveField(3)
  String country;
  @HiveField(4)
  String state;
  @HiveField(5)
  String zipcode;
  @HiveField(6)
  String company;
  @HiveField(7)
  String phone;

  Address(this.name, this.address, this.city, this.country, this.state,
      this.zipcode, this.phone, this.company);
}
