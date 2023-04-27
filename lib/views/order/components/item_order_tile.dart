import 'package:baltini_flutter_apps/utils/utils/date_formatter.dart';
import 'package:baltini_flutter_apps/views/order/components/item_tile.dart';
import 'package:flutter/material.dart';

import '../../../utils/models/order.dart';

class OrderTile extends StatelessWidget {
  Order current;

  OrderTile({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(current.id),
              Text(TimeFormatter.getDate(current.orderDate)),
            ],
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return OrderItemTile(current: current, index: index);
            },
            itemCount: current.products.length,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Total Price',
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Rp. ${current.totalPrice}',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
