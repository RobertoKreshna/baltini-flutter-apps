import 'package:baltini_flutter_apps/utils/components/button.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/models/address.dart';

class AddressConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutFlowVM>(
      builder: (context, value, child) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Is the shipping address correct?',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '${value.shippingaddress1.text}, ${value.shippingaddress2.text}',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                value.shippingcity.text,
                style: TextStyle(fontSize: 14),
              ),
              Text(
                value.shippingstate.text,
                style: TextStyle(fontSize: 14),
              ),
              Text(
                value.shippingzipcode.text,
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: BaltiniButton(
                    text: 'MODIFY ADDRESS', blackBG: true, size: 14),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  value.shippingAddress = Address(
                    '${value.shippingfirstname.text} ${value.shippinglastname.text}',
                    '${value.shippingaddress1.text} ${value.shippingaddress2.text}',
                    value.shippingcity.text,
                    value.shippingcountry.text,
                    value.shippingstate.text,
                    value.shippingzipcode.text,
                    value.shippingphone.text,
                    value.shippingcompany.text,
                  );
                  value.billingAddress = value.shippingAddress;
                  Navigator.pushNamed(context, '/shipping');
                },
                child: BaltiniButton(
                    text: 'YES, PROCEED', blackBG: true, size: 14),
              ),
            ],
          ),
        );
      },
    );
  }
}
