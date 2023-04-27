import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/utils/models/order.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/cart/vm/cart_vm.dart';
import 'package:baltini_flutter_apps/views/checkout/components/payment/billing_address_form.dart';
import 'package:baltini_flutter_apps/views/checkout/components/payment/payment_choice.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/contact_summary.dart';
import 'components/item_and_summary.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Consumer3<CheckoutFlowVM, AccountVM, CartVM>(
              builder: (context, value, account, cart, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BackAndTitle(
                        title: 'Payment',
                        onPressed: () {
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
                        value.billingAddress = value.shippingAddress;
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
                        value.billingAddress = null;
                      },
                      title: Text('Use a different billing address'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    value.sameAddress ? Container() : BillingAddressForm(),
                    SizedBox(
                      height: 38,
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Total Price',
                              ),
                              Text(
                                'Rp. ${value.total}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              cart.finish();
                              account.addOrder(value.getOrder());
                              value.clearAll();
                              Navigator.pushNamed(context, '/');
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                'PAY NOW',
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
