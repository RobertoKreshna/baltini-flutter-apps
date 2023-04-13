import 'package:baltini_flutter_apps/views/account/components/button.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutFlowVM>(
      builder: (context, value, child) {
        return AlertDialog(
          content: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Is the shipping address correct?',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  '${value.address1.text}, ${value.address2.text}',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '${value.city.text}',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '${value.state.text}',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  '${value.zipcode.text}',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  height: 32,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AccountButton('MODIFY ADDRESS', true, 14),
                ),
                SizedBox(
                  height: 8,
                ),
                GestureDetector(
                  onTap: () {},
                  child: AccountButton('YES, PROCEED', true, 14),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
