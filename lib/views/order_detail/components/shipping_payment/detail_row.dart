import 'package:flutter/material.dart';

class ShippingPaymentDetailRow extends StatelessWidget {
  String top, bottom;
  ShippingPaymentDetailRow(
      {super.key, required this.top, required this.bottom});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Text(
          top.toUpperCase(),
          style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.5)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(bottom),
        ),
      ],
    );
  }
}
