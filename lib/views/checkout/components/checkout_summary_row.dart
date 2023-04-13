import 'package:flutter/material.dart';

class CheckoutSummaryRow extends StatelessWidget {
  String text1, text2;
  String? text3;
  double? size1, size2, size3;

  CheckoutSummaryRow({
    required this.text1,
    this.size1 = 14.0,
    required this.text2,
    this.size2 = 14.0,
    this.text3 = '',
    this.size3 = 14.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text1,
          style: TextStyle(fontSize: size1),
        ),
        Text(
          text2,
          style: TextStyle(fontSize: size2),
        ),
      ],
    );
  }
}
