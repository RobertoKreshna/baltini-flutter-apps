import 'package:flutter/material.dart';

class OrderSummaryRow extends StatelessWidget {
  String left, right;
  FontWeight weight;

  OrderSummaryRow(
      {super.key,
      required this.left,
      required this.right,
      this.weight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$left'),
          Text(
            'Rp. $right',
            style: TextStyle(fontSize: 14, fontWeight: weight),
          ),
        ],
      ),
    );
  }
}
