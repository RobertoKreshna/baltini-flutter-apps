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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Country', controller: value.shippingcountry),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'First Name', controller: value.shippingfirstname),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Last Name', controller: value.shippinglastname),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Company (optional)',
                  controller: value.shippingcompany),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Address', controller: value.shippingaddress1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Apartment, suite, etc. (optional)',
                  controller: value.shippingaddress2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child:
                  NonPWTextField(text: 'City', controller: value.shippingcity),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'State', controller: value.shippingstate),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Zip Code', controller: value.shippingzipcode),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Phone', controller: value.shippingphone),
            ),
          ],
        );
      },
    );
  }
}
