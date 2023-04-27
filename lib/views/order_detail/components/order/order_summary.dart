import 'package:baltini_flutter_apps/utils/models/order.dart';
import 'package:flutter/material.dart';

import 'order_detail_item_tile.dart';
import 'summary_row.dart';

class OrderDetailComponents extends StatelessWidget {
  Order current;
  OrderDetailComponents({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order Summary'.toUpperCase()),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: current.products.length,
            itemBuilder: (BuildContext context, int index) {
              return OrderDetailItemTile(
                current: current,
                index: index,
              );
            },
          ),
        ),
        OrderSummaryRow(left: 'Subtotal', right: current.subTotal),
        OrderSummaryRow(left: 'Shipping', right: current.shippingCost),
        OrderSummaryRow(
            left: 'Import Duty/Taxes', right: current.importDutyTaxes),
        OrderSummaryRow(
            left: 'Estimated Taxes', right: current.importDutyTaxes),
        OrderSummaryRow(
          left: 'Total',
          right: current.totalPrice,
          weight: FontWeight.w700,
        ),
      ],
    );
  }
}
