import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:baltini_flutter_apps/views/checkout/components/checkout_item_tile.dart';
import 'package:baltini_flutter_apps/views/checkout/components/giftcard_discount_textfield.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:provider/provider.dart';

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
                                '\$22.00',
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
                          )
                        ],
                      ),
                    )
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
