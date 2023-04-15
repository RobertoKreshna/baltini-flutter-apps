import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/checkout/components/payment_choice.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/contact_summary.dart';
import 'item_and_summary.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Consumer<CheckoutFlowVM>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackAndTitle('Payment', () {
                      Navigator.pop(context);
                    }),
                    ItemAndSummary(),
                    Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 2,
                      thickness: 2,
                    ),
                    ContactSummary(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'METHOD',
                          style: TextStyle(fontSize: 10),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${value.shippingmethods.keys.elementAt(value.selectedShipping)}\n- Rp.${value.shippingmethods.values.elementAt(value.selectedShipping).toInt()}',
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text('PAYMENT'),
                    SizedBox(
                      height: 16,
                    ),
                    Text('All transactions are secure and encrypted.'),
                    PaymentChoice(),
                    SizedBox(
                      height: 24,
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text('BILLING ADDRESS'),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Select the address that matches your card or payment method.',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    RadioListTile(
                      visualDensity: VisualDensity.compact,
                      dense: true,
                      activeColor: Colors.black,
                      value: true,
                      groupValue: value.sameAddress,
                      onChanged: (newValue) {
                        value.sameOrDifferentAddress(newValue!);
                      },
                      title: Text('Same as shipping address'),
                    ),
                    RadioListTile(
                      visualDensity: VisualDensity.compact,
                      dense: true,
                      activeColor: Colors.black,
                      value: false,
                      groupValue: value.sameAddress,
                      onChanged: (newValue) {
                        value.sameOrDifferentAddress(newValue!);
                      },
                      title: Text('Use a different billing address'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    value.sameAddress ? Container() : Container(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
