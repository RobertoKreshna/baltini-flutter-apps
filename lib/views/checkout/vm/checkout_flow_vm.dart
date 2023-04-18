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
  var shippingcountry = TextEditingController();
  var shippingfirstname = TextEditingController();
  var shippinglastname = TextEditingController();
  var shippingcompany = TextEditingController();
  var shippingaddress1 = TextEditingController();
  var shippingaddress2 = TextEditingController();
  var shippingcity = TextEditingController();
  var shippingstate = TextEditingController();
  var shippingzipcode = TextEditingController();
  var shippingphone = TextEditingController();

  var billingcountry = TextEditingController();
  var billingfirstname = TextEditingController();
  var billinglastname = TextEditingController();
  var billingcompany = TextEditingController();
  var billingaddress1 = TextEditingController();
  var billingaddress2 = TextEditingController();
  var billingcity = TextEditingController();
  var billingstate = TextEditingController();
  var billingzipcode = TextEditingController();
  var billingphone = TextEditingController();

  Address? shippingAddress, billingAddress;
  bool sameAddress = true;

  //address confirm
  bool addressconfirmvalue = false;

  //shipping method
  Map<String, double> shippingmethods = {
    'Default Shipping (3-5 days) Tax Included': 50000.0,
    'Express Shipping (2-3 days) Tax Included': 150000.0,
    'Same Day Shipping (1 day) Tax Included': 300000.0,
  };
  int selectedShipping = 0;
  //payment method
  Map<String, List<String>> paymentmethods = {
    'Credit Card': [cc1, cc2, cc3, cc4],
    'Shop pay - Pay in full or in installments': [shoppay],
    'Afterpay': [afterpay],
    'Klarna - Flexible payments': [klarna],
    'NihaoPay': [nihao1, nihao2, nihao3],
  };
  int selectedPayment = 0;

  clearAll() {
    shippingcountry.clear();
    shippingfirstname.clear();
    shippinglastname.clear();
    shippingcompany.clear();
    shippingaddress1.clear();
    shippingaddress2.clear();
    shippingcity.clear();
    shippingstate.clear();
    shippingzipcode.clear();
    shippingphone.clear();
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
    discountCodeValidator = value;
    notifyListeners();
  }

  getitemSubtotalandShipping() {
    int res = 0;
    for (int i = 0; i < checkoutProduct.length; i++) {
      int price = getTotalPerItem(i);
      res += price;
    }
    subtotal = res;
    updateShipping();
    if (shipping == null) {
      shipping = shippingmethods.values.elementAt(0).toInt();
    }
  }

  updateShipping() {
    if (subtotal! > 2000000) {
      shippingmethods['Default Shipping (3-5 days) Tax Included'] = 0;
    } else {
      shippingmethods['Default Shipping (3-5 days) Tax Included'] = 50000;
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
    shippingfirstname.text = current.firstName;
    shippinglastname.text = current.lastName;
    shippingcountry.text = current.address[0].country;
    shippingaddress1.text = current.address[0].address;
    shippingcity.text = current.address[0].city;
    shippingstate.text = current.address[0].state;
    shippingzipcode.text = current.address[0].zipcode;
    shippingphone.text = current.address[0].phone;
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

  setSelectedPayment(int index) {
    selectedPayment = index;
    notifyListeners();
  }

  sameOrDifferentAddress(bool value) {
    sameAddress = value;
    notifyListeners();
  }
}
