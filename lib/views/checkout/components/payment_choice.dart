import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutFlowVM>(
      builder: (context, value, child) {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: value.paymentmethods.keys.length,
          itemBuilder: (BuildContext context, int index) {
            return RadioListTile(
              dense: true,
              visualDensity: VisualDensity.compact,
              contentPadding: EdgeInsets.all(1.0),
              activeColor: Colors.black,
              value: index,
              groupValue: value.selectedPayment,
              onChanged: (newValue) {
                value.setSelectedPayment(index);
              },
              title: Text(
                value.paymentmethods.keys.toList()[index],
                style: TextStyle(fontSize: 14),
              ),
              subtitle: Container(
                height: 32,
                width: double.infinity,
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount:
                        value.paymentmethods.values.elementAt(index).length,
                    itemBuilder: (BuildContext context, int indexInside) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Container(
                          width: 32,
                          height: 32,
                          child: Image.asset(value.paymentmethods.values
                              .elementAt(index)
                              .elementAt(indexInside)),
                        ),
                      );
                    }),
              ),
            );
          },
        );
      },
    );
  }
}
