import 'package:baltini_flutter_apps/utils/hive/boxes.dart';
import 'package:baltini_flutter_apps/views/account/vm/account_vm.dart';
import 'package:baltini_flutter_apps/views/order/components/item_order_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<AccountVM>(
          builder: (context, value, child) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'My Order',
                      style: TextStyle(fontSize: 18),
                    ),
                    value.userLoggedin
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: value.currentUser!.orders.length,
                            itemBuilder: (context, index) {
                              return OrderTile(
                                  current: value.currentUser!.orders
                                      .elementAt(index));
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.black.withOpacity(0.5),
                              );
                            },
                          )
                        : ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: Boxes.getOrderBox().values.length,
                            itemBuilder: (context, index) {
                              return OrderTile(
                                  current: Boxes.getOrderBox()
                                      .values
                                      .elementAt(index));
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.black.withOpacity(0.5),
                              );
                            },
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
