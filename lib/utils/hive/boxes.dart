import 'package:hive/hive.dart';

import '../models/user.dart';

class Boxes {
  static Box<User> getUsersBox() => Hive.box<User>('users');

  static int getUserIndex(User current) {
    final box = Boxes.getUsersBox();
    Map users = box.toMap();
    int index = -1;
    int i = 0;
    for (User user in users.values) {
      if (user == current) {
        index = i;
        break;
      }
      i += 1;
    }
    return index;
  }
}
