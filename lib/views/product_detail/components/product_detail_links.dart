import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:flutter/material.dart';

class ProductDetailLink extends StatelessWidget {
  String path, text;

  ProductDetailLink(this.path, this.text);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Image.asset(arrowright),
        ],
      ),
    );
  }
}
