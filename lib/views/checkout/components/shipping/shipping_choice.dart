import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingChoice extends StatelessWidget {
  const ShippingChoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutFlowVM>(
      builder: (context, value, child) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: value.shippingmethods.keys.length,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile(
              contentPadding: EdgeInsets.all(1.0),
              dense: true,
              visualDensity: VisualDensity.compact,
              activeColor: Colors.black,
              value: index,
              groupValue: value.selectedShipping,
              onChanged: (newValue) {
                value.setSelectedShipping(index);
              },
              title: Text(
                value.shippingmethods.keys.toList()[index],
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Text('subtitle'),
              secondary: Text(
                'Rp. ${value.shippingmethods.values.elementAt(index).toString()}',
                style: TextStyle(fontSize: 14),
              ),
            );
          },
        );
      },
    );
  }
}
