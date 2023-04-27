import 'package:baltini_flutter_apps/utils/components/back_and_title.dart';
import 'package:baltini_flutter_apps/utils/utils/date_formatter.dart';
import 'package:baltini_flutter_apps/views/order_detail/vm/order_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/order_summary.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderDetailVM>(
      builder: (context, value, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackAndTitle(
                      title: 'Order ${value.current!.id}',
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  Text(
                    'ORDER ID',
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      value.current!.id,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Text(
                    'ORDER DATE',
                    style: TextStyle(
                        fontSize: 12, color: Colors.black.withOpacity(0.5)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      TimeFormatter.getDate(value.current!.orderDate),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  Divider(
                    color: Colors.black.withOpacity(0.5),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  OrderDetailComponents(current: value.current!),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
