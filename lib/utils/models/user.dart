import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String firstName;
  @HiveField(1)
  late String lastName;
  @HiveField(2)
  late String email;
  @HiveField(3)
  late String password;
  @HiveField(4)
  late List address;
  @HiveField(5)
  late List order;

  User(this.firstName, this.lastName, this.email, this.password);
}
