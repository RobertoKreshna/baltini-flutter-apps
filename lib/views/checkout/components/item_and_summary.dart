import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:invert_colors/invert_colors.dart';
import 'package:provider/provider.dart';

import '../../utils/const/asset_path.dart';
import 'components/checkout_item_tile.dart';
import 'components/checkout_summary.dart';
import 'components/giftcard_discount_textfield.dart';

class ItemAndSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutFlowVM>(
      builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ORDER SUMMARY'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
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
          ],
        );
      },
    );
  }
}
