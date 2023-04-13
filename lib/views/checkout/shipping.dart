import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/components/back_and_title.dart';
import 'components/contact_summary.dart';
import 'item_and_summary.dart';

class ShippingPage extends StatelessWidget {
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
                    BackAndTitle('Shipping', () {
                      value.selectedShipping = 0;
                      Navigator.pop(context);
                    }),
                    ItemAndSummary(),
                    Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 2,
                      thickness: 2,
                    ),
                    ContactSummary(),
                    Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'SHIPPING METHOD',
                      style: TextStyle(fontSize: 14),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: value.shippingmethods.keys.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RadioListTile(
                          activeColor: Colors.black,
                          value: index,
                          groupValue: value.selectedShipping,
                          onChanged: (newValue) {
                            value.setSelectedShipping(index);
                          },
                          title: Text(
                            value.shippingmethods.keys.toList()[index],
                            style: TextStyle(fontSize: 14),
                          ),
                          subtitle: Text('subtitle'),
                          secondary: Text(
                            'Rp. ${value.shippingmethods.values.elementAt(index).toString()}',
                            style: TextStyle(fontSize: 14),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 2,
                      thickness: 2,
                    ),
                    SizedBox(
                      height: 12,
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
                              Navigator.pushNamed(context, '/payment');
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                'TO PAYMENT',
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
