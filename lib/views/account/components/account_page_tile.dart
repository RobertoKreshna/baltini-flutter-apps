import 'package:baltini_flutter_apps/utils/const/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class AccountPageTile extends StatelessWidget {
  String path;
  String name;

  AccountPageTile(this.path, this.name);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name),
          Container(
            child: Image.asset(arrowright),
          ),
        ],
      ),
    );
  }
}
