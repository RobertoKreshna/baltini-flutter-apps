import 'package:baltini_flutter_apps/utils/models/order.dart';
import 'package:baltini_flutter_apps/utils/utils/address_formatter.dart';
import 'package:baltini_flutter_apps/utils/utils/date_formatter.dart';
import 'package:flutter/material.dart';

import 'detail_row.dart';

class PaymentSummary extends StatelessWidget {
  Order current;

  PaymentSummary({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment'.toUpperCase()),
        ShippingPaymentDetailRow(
            top: 'Payment Method', bottom: current.paymentMethod),
        ShippingPaymentDetailRow(
          top: 'Payment Time',
          bottom: TimeFormatter.getDate(current.paymentDate),
        ),
        ShippingPaymentDetailRow(
          top: 'Billing Address',
          bottom: AddressFormatter.getAddress(current.billingAddress),
        )
      ],
    );
  }
}
