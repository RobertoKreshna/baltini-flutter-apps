import 'package:baltini_flutter_apps/utils/components/textfield.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<AccountVM, CheckoutFlowVM>(
      builder: (context, value, checkout, child) {
        if (value.userLoggedin) {
          checkout.setShippingAddress(value.currentUser!);
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('SHIPPING ADDRESS'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    191,
                    20,
                    20,
                    1.0,
                  ).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Please double check the shipping address to ensure prompt delivery'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Country', controller: checkout.shippingcountry),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'First Name', controller: checkout.shippingfirstname),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Last Name', controller: checkout.shippinglastname),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Company (optional)',
                  controller: checkout.shippingcompany),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Address', controller: checkout.shippingaddress1),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Apartment, suite, etc. (optional)',
                  controller: checkout.shippingaddress2),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'City', controller: checkout.shippingcity),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'State', controller: checkout.shippingstate),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Zip Code', controller: checkout.shippingzipcode),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: NonPWTextField(
                  text: 'Phone', controller: checkout.shippingphone),
            ),
          ],
        );
      },
    );
  }
}
