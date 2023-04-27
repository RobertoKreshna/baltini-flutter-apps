import 'package:baltini_flutter_apps/utils/models/address.dart';

class AddressFormatter {
  static String getAddress(Address current) {
    String res =
        '${current.address}, ${current.city} ${current.state} ${current.zipcode}, ${current.country}';
    return res;
  }
}
