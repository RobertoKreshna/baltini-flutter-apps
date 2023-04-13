import 'package:baltini_flutter_apps/views/checkout/components/checkout_summary_row.dart';
import 'package:baltini_flutter_apps/views/checkout/vm/checkout_flow_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutFlowVM>(
      builder: (context, value, child) {
        return Column(
          children: [
            CheckoutSummaryRow(
                text1: 'Subtotal', text2: 'Rp. ${value.subtotal}'),
            SizedBox(
              height: 8,
            ),
            CheckoutSummaryRow(
                text1: 'Shipping', text2: 'Rp. ${value.shipping}'),
            SizedBox(
              height: 8,
            ),
            CheckoutSummaryRow(
              text1: 'Import duty or taxes',
              text2: 'calculated at next step',
              size2: 12,
            ),
            SizedBox(
              height: 8,
            ),
            CheckoutSummaryRow(text1: 'Total', text2: 'Rp. ${value.total}'),
          ],
        );
      },
    );
  }
}
