import 'package:baltini_flutter_apps/utils/utils/date_formatter.dart';
import 'package:baltini_flutter_apps/views/order/components/item_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/models/order.dart';
import '../../order_detail/vm/order_detail_vm.dart';

class OrderTile extends StatelessWidget {
  Order current;

  OrderTile({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailVM>(
      builder: (context, value, child) {
        return GestureDetector(
          onTap: () {
            value.setOrder(current);
            Navigator.pushNamed(context, '/orderdetail');
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(current.id),
                  Text(TimeFormatter.getDate(current.orderDate)),
                ],
              ),
              OrderItemTile(current: current, index: 0),
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
      },
    );
  }
}
