import 'package:flutter/material.dart';

class ProductDetailDesc extends StatelessWidget {
  String keys, value;

  ProductDetailDesc(this.keys, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$keys : ',
          style:
              TextStyle(fontSize: 14, height: 1.5, fontWeight: FontWeight.w600),
        ),
        Text(
          '$value',
          style: TextStyle(fontSize: 14, height: 1.5),
        ),
      ],
    );
  }
}
