import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutItemTile extends StatelessWidget {
  int index;

  CheckoutItemTile(this.index);

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutFlowVM>(
      builder: (context, value, child) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 93,
                  child: value.checkoutProduct[index].image == 'null'
                      ? Image.asset('assets/images/placeholder.png')
                      : Image.network(value.checkoutProduct[index].image),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.checkoutProduct[index].vendor,
                        style: TextStyle(height: 1.5),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        value.checkoutProduct[index].title,
                        style: TextStyle(height: 1.5),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${value.checkoutProduct[index].options[1]['values'][value.sizeIndex[index]]}, ${value.checkoutProduct[index].options[0]['values'][0]}',
                        style: TextStyle(height: 1.5),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp. ${double.parse(value.checkoutProduct[index].price).toInt()} x ${value.quantity[index]}',
                            style: TextStyle(height: 1.5),
                          ),
                          Text(
                            'Rp. ${value.getTotalPerItem(index)}',
                            style: TextStyle(height: 1.5, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
