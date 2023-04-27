import 'package:baltini_flutter_apps/utils/models/order.dart';
import 'package:baltini_flutter_apps/utils/utils/address_formatter.dart';
import 'package:baltini_flutter_apps/views/order_detail/components/shipping_payment/detail_row.dart';
import 'package:flutter/material.dart';

class ShippingSummary extends StatelessWidget {
  Order current;

  ShippingSummary({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Information'.toUpperCase()),
        ShippingPaymentDetailRow(top: 'Contact', bottom: current.email),
        ShippingPaymentDetailRow(
          top: 'Ship to',
          bottom: AddressFormatter.getAddress(current.shippingAddress),
        ),
        ShippingPaymentDetailRow(
            top: 'Method',
            bottom: '${current.shippingMethod} - Rp.${current.shippingCost}'),
      ],
    );
  }
}
