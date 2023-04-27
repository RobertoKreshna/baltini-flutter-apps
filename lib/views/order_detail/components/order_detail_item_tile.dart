import 'package:baltini_flutter_apps/utils/models/order.dart';
import 'package:baltini_flutter_apps/utils/models/product.dart';
import 'package:baltini_flutter_apps/views/order_detail/vm/order_detail_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/const/asset_path.dart';

class OrderDetailItemTile extends StatelessWidget {
  Order current;
  int index;

  OrderDetailItemTile({super.key, required this.current, required this.index});

  @override
  Widget build(BuildContext context) {
    return current.products[index].title != 'Shipping Protection'
        ? Row(
            children: [
              SizedBox(
                width: 70,
                height: 93,
                child: current.products[index].image == 'null'
                    ? Image.asset(placeholder)
                    : Image.network(
                        current.products[index].image,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(placeholder);
                        },
                      ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      current.products[index].vendor,
                      style: TextStyle(height: 1.5),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      current.products[index].title,
                      style: TextStyle(height: 1.5),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '${current.products[index].options[1]['values'][current.sizeIndex[index]]}, ${current.products[index].options[0]['values'][0]}',
                      style: TextStyle(height: 1.5),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Rp. ${double.parse(current.products[index].price).toInt()} x ${current.qty[index]}',
                          style: TextStyle(height: 1.5),
                        ),
                        Consumer<OrderDetailVM>(
                          builder: (context, value, child) {
                            return Text(
                              'Rp. ${value.getTotalperItem(index)}',
                              style: TextStyle(height: 1.5),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70, height: 93, child: Image.asset(shipping)),
                  Text(
                    current.products[index].title,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Rp. ${double.parse(current.products[index].price).toInt()}',
                    style: TextStyle(height: 1.5),
                  ),
                ],
              ),
            ],
          );
  }
}
