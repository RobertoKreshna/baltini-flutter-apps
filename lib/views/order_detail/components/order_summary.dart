import 'package:baltini_flutter_apps/utils/models/order.dart';
import 'package:baltini_flutter_apps/views/order_detail/components/summary_row.dart';
import 'package:flutter/material.dart';

import 'order_detail_item_tile.dart';

class OrderDetailComponents extends StatelessWidget {
  Order current;
  OrderDetailComponents({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('ORDER SUMMARY'),
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
        OrderSummaryRow(left: 'Subtotal', right: 'Rp. ${current.subTotal}'),
        OrderSummaryRow(left: 'Shipping', right: 'Rp. ${current.shippingCost}'),
        OrderSummaryRow(
            left: 'Import Duty/Taxes', right: 'Rp. ${current.importDutyTaxes}'),
        OrderSummaryRow(
            left: 'Estimated Taxes', right: 'Rp. ${current.importDutyTaxes}'),
        OrderSummaryRow(
          left: 'Total',
          right: 'Rp. ${current.totalPrice}',
          weight: FontWeight.w700,
        ),
      ],
    );
  }
}
