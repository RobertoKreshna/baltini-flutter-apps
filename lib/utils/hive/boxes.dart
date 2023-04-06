import 'package:hive/hive.dart';

import '../models/user.dart';

class Boxes {
  static Box<User> getUsersBox() => Hive.box<User>('users');
}
