import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  String name;
  String? image;
  Color? color;

  CustomTile({
    required this.name,
    this.image = arrowright,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(color: color),
          ),
          Container(
            child: image == '' ? Container() : Image.asset(image!),
          ),
        ],
      ),
    );
  }
}
