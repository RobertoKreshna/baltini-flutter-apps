import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/checkout/components/address_confrimation.dart';
import 'package:baltini_flutter_apps/views/checkout/components/checkout_item_tile.dart';
import 'package:baltini_flutter_apps/views/checkout/components/giftcard_discount_textfield.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:provider/provider.dart';

import 'components/checkout_summary.dart';
import 'components/contact_information.dart';
import 'components/shipping_address.dart';

class CheckoutPage extends StatelessWidget {
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
                    BackAndTitle('Checkout', () {
                      Navigator.pop(context);
                    }),
                    Text('ORDER SUMMARY'),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.checkoutProduct.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CheckoutItemTile(index);
                        },
                      ),
                    ),
                    value.protect
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(shipping),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text('Shipping Protection'),
                                ],
                              ),
                              Text(
                                'Rp. 325000',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        : Container(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GiftDiscountTextField(),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: value.discountCodeValidator
                                  ? Colors.white
                                  : Colors.black,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: value.discountCodeValidator
                                ? Image.asset(delete)
                                : InvertColors(child: Image.asset(arrowright)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: CheckoutSummary(),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 2,
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: ContactInformation(),
                    ),
                    Divider(
                      color: Colors.black.withOpacity(0.2),
                      height: 2,
                      thickness: 2,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: ShippingAddress(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Divider(
                        color: Colors.black.withOpacity(0.2),
                        height: 2,
                        thickness: 2,
                      ),
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
                            onTap: () => showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (BuildContext context) {
                                  return AddressConfirmation();
                                }),
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                'SHIPPING',
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
