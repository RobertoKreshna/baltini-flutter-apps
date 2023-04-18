import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GiftDiscountTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutFlowVM>(
      builder: (context, value, child) {
        return TextFormField(
          controller: value.discountCode,
          decoration: InputDecoration(
            labelText: 'Gift card or discount code',
            labelStyle:
                TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.5))),
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (formValue) {
            if (formValue!.isNotEmpty && formValue.length < 8) {
              return 'Code wrong or invalid';
            }
          },
          onFieldSubmitted: (formValue) {
            if (formValue.isNotEmpty && formValue.length > 8) {
              value.toggleValidator(true);
            } else {
              value.toggleValidator(false);
            }
          },
        );
      },
    );
  }
}
