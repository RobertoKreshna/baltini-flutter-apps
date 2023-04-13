import 'package:baltini_flutter_apps/utils/models/product.dart';
import 'package:baltini_flutter_apps/utils/models/user.dart';
import 'package:flutter/material.dart';

class CheckoutFlowVM extends ChangeNotifier {
  //initial
  List<Product> checkoutProduct = [];
  List<int> quantity = [];
  List<int> sizeIndex = [];
  bool protect = false;
  //discount code
  var discountCode = TextEditingController();
  bool discountCodeValidator = false;
  //summary
  int? subtotal, shipping, total;
  //contact
  var email = TextEditingController();
  bool wantedtoEmail = false;
  //shipping address
  var savedaddress = TextEditingController();
  var country = TextEditingController();
  var firstname = TextEditingController();
  var lastname = TextEditingController();
  var company = TextEditingController();
  var address1 = TextEditingController();
  var address2 = TextEditingController();
  var city = TextEditingController();
  var state = TextEditingController();
  var zipcode = TextEditingController();
  var phone = TextEditingController();

  setProductQtyProtect(
      List<Product> prod, List<int> qty, List<int> size, bool protectValue) {
    checkoutProduct = prod;
    quantity = qty;
    sizeIndex = size;
    protect = protectValue;
  }

  getTotalPerItem(int index) {
    return double.parse(checkoutProduct[index].price).toInt() * quantity[index];
  }

  toggleValidator(bool value) {
    this.discountCodeValidator = value;
    notifyListeners();
  }

  getitemSubtotal() {
    int res = 0;
    for (int i = 0; i < checkoutProduct.length; i++) {
      int price = getTotalPerItem(i);
      res += price;
    }
    subtotal = res;
  }

  getShipping() {
    if (subtotal! > 2000000) {
      shipping = 0;
    } else {
      shipping = 50000;
    }
  }

  getTotal() {
    total = subtotal! + shipping!;
    if (protect) total = total! + 325000;
  }

  toggleEmail() {
    wantedtoEmail = !wantedtoEmail;
    notifyListeners();
  }

  setShippingAddress(User current) {
    savedaddress.text =
        '${current.address[0].country} (${current.firstName} ${current.lastName})';
    firstname.text = current.firstName;
    lastname.text = current.lastName;
  }
}
