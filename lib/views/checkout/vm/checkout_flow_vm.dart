import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/utils/models/address.dart';
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
  //shipping & billing address
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

  Address? shippingAddress, billingAddress;
  //address confirm
  bool addressconfirmvalue = false;
  //shipping method
  Map<String, double> shippingmethods = {
    'Regular Shipping (3-5 days) Tax Included': 50000.0,
    'Express Shipping (2-3 days) Tax Included': 150000.0,
    'Same Day Shipping (1 day) Tax Included': 300000.0,
  };
  int selectedShipping = 0;
  //payment method
  Map<String, List<String>> paymentmethods = {
    'Credit Card': [placeholder],
    'Shop pay - Pay in full or in installments': [placeholder],
    'Afterpay': [placeholder],
    'Klarna - Flexible payments': [placeholder],
    'NihaoPay': [placeholder],
  };

  clearAll() {
    savedaddress.clear();
    country.clear();
    firstname.clear();
    lastname.clear();
    company.clear();
    address1.clear();
    address2.clear();
    city.clear();
    state.clear();
    zipcode.clear();
    phone.clear();
  }

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

  getitemSubtotalandShipping() {
    int res = 0;
    for (int i = 0; i < checkoutProduct.length; i++) {
      int price = getTotalPerItem(i);
      res += price;
    }
    subtotal = res;
    if (subtotal! > 2000000) {
      shippingmethods['Regular Shipping (3-5 days) Tax Included'] = 0;
    } else {
      shippingmethods['Regular Shipping (3-5 days) Tax Included'] = 50000;
    }
    if (shipping == null) {
      shipping = shippingmethods.values.elementAt(0).toInt();
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

  setSelectedShipping(int index) {
    selectedShipping = index;
    shipping = shippingmethods.values.elementAt(index).toInt();
    getTotal();
    notifyListeners();
  }

  resetSelectedShipping() {
    selectedShipping = 0;
    shipping = shippingmethods.values.elementAt(0).toInt();
    getTotal();
    notifyListeners();
  }
}
