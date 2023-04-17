import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/components/textfield.dart';
import '../vm/checkout_flow_vm.dart';

class BillingAddressForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutFlowVM>(
      builder: (context, value, child) {
        return Column(
          children: [
            NonPWTextField(text: 'Country', controller: value.shippingcountry),
            NonPWTextField(
                text: 'First Name', controller: value.shippingfirstname),
            NonPWTextField(
                text: 'Last Name', controller: value.shippinglastname),
            NonPWTextField(
                text: 'Company (optional)', controller: value.shippingcompany),
            NonPWTextField(text: 'Address', controller: value.shippingaddress1),
            NonPWTextField(
                text: 'Apartment, suite, etc. (optional)',
                controller: value.shippingaddress2),
            NonPWTextField(text: 'City', controller: value.shippingcity),
            NonPWTextField(text: 'State', controller: value.shippingstate),
            NonPWTextField(text: 'Zip Code', controller: value.shippingzipcode),
            NonPWTextField(text: 'Phone', controller: value.shippingphone),
          ],
        );
      },
    );
  }
}
